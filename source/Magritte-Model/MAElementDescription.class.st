"
I am an abstract description for all basic description types.
"
Class {
	#name : 'MAElementDescription',
	#superclass : 'MADescription',
	#category : 'Magritte-Model-Description'
}

{ #category : 'accessing-defaults' }
MAElementDescription class >> defaultAutoAccept [
	^ false
]

{ #category : 'instance creation' }
MAElementDescription class >> new [
	"override #new so that we can create an object without adding it to the collection returned by: MAElementDescription withAllConcreteClasses,
	that is so we can call  MAElementDescription new magritteDescription  and it works as expected, which is used in MADescriptionEditor>>#buildReport .
	Yes it's a hack, but it works... (better ideas gratefully received)"
	^ self basicNew initialize
]

{ #category : 'visiting' }
MAElementDescription >> acceptMagritte: aVisitor [
	aVisitor visitElementDescription: self
]

{ #category : 'converting' }
MAElementDescription >> asContainer [
	^ MAContainer with: self
]

{ #category : 'accessing' }
MAElementDescription >> autoAccept [
	"Define whether new memento values should be automatically propagated to a model.
	
	New values are propagated to the model only if successfully validated. See {{gtMethod: GtMagritteMemento >> #autoAcceptValue: }} for more details."

	^ self 
		propertyAt: #autoAccept 
		ifAbsent: [ self class defaultAutoAccept ]
]

{ #category : 'accessing' }
MAElementDescription >> autoAccept: aBoolean [
	"Set whether new memento values should be automatically propagated to a model.
	
	New values are propagated to the model only if successfully validated. See {{gtMethod: GtMagritteMemento >> #autoAcceptValue: }} for more details."
	
	self propertyAt: #autoAccept put: aBoolean
]

{ #category : 'accessing' }
MAElementDescription >> default [
	^ self propertyAt: #default ifAbsent: [ self class defaultDefault ]
]

{ #category : 'accessing' }
MAElementDescription >> default: anObject [
	self propertyAt: #default put: anObject
]

{ #category : 'accessing' }
MAElementDescription >> definingContext [
	
	^ self propertyAt: #definingContext ifAbsent: [ nil ]
]

{ #category : 'accessing' }
MAElementDescription >> definingContext: anMADefiningContext [
	
	^ self propertyAt: #definingContext  put: anMADefiningContext
]

{ #category : 'testing' }
MAElementDescription >> handleMessage: aMessage for: anObject [
	"We do no error checking; you probably want to send #handlesSelector: first to make sure"
	^ aMessage numArgs = 0
		ifTrue: [ anObject readUsing: self ]
		ifFalse: [ anObject write: aMessage argument using: self ]
]

{ #category : 'testing' }
MAElementDescription >> handlesSelector: aSelector [
	^ self accessor handlesSelector: aSelector
]

{ #category : 'accessing' }
MAElementDescription >> initialAnswer [
	^ self propertyAt: #initialAnswer ifAbsent: [ self default ]
]

{ #category : 'accessing' }
MAElementDescription >> initialAnswer: aValuable [
	self propertyAt: #initialAnswer put: aValuable
]

{ #category : 'utility' }
MAElementDescription >> isIgnorableValue: anObject [

	| ignorableValues isIgnorableDefault |

	ignorableValues := OrderedCollection
		with: nil
		with: self undefinedValue.
	
	isIgnorableDefault := self shouldCacheDefault not and: [ anObject = self default ].
	isIgnorableDefault ifTrue: [ ignorableValues add: self default ].
	
	^ ignorableValues includes: anObject
]

{ #category : 'lazy initialization' }
MAElementDescription >> lazilyInitializeFrom: currentValue for: anObject [
	"- The default value is cached if the description's #shouldCacheDefault property is true. An example when caching is necessary is for to-many relations because the user may modify the collection, which will then be thrown away if not cached

	Usage: 
		MyDomainObject>>#getter
			^ self maLazyPropertyUsing: self descriptionName
		
		MyDomainObject>>#descriptionName
			^ MAStringDescription new
					accessor: #name;
					default: 'Alan';
					yourself"
	
	| defaultValue |		
	currentValue ifNotNil: [ ^ currentValue ].
	defaultValue := self default.
	self shouldCacheDefault ifTrue: [ anObject write: defaultValue using: self ].
	^ defaultValue
]

{ #category : 'testing' }
MAElementDescription >> printFor: anObject on: aWriteStream [ 
	(self read: anObject) ifNotNil: [ :value | aWriteStream nextPutAll: (self toString: value) ]
]

{ #category : 'utility' }
MAElementDescription >> shouldWrite: anObject over: anotherObject [

	self isVisible ifFalse: [ ^ false ].
	self isReadOnly ifTrue: [ ^ false ].
	
	((self isIgnorableValue: anObject) and: [ self isIgnorableValue: anotherObject ])
		ifTrue: [ ^ false ].
	
	(anObject == anotherObject or: [ anObject = anotherObject ])
		ifTrue: [ ^ false ].
		
	^ true
	
	"Implementation note: We compare via both #== and #= to cover two scenarios:
		1) a referenced object that changes on the outside. From our perspective, as long as we are still refering to the same object there is no relevant change. Unless we accept identity equality, any changes to complex objects from outside will bleed into this object. E.g. if outside someone does `self person age: 25`, this object will appear to be changed. This would wreak havoc with mementos, forms, etc.
		2) objects (e.g. strings and other value objects) that override #= to mean something other than identity comparison."
]

{ #category : 'printing' }
MAElementDescription >> storeOn: aStream [
	
	| source formattedSource |
	source := String streamContents: [ :str |
		str
			nextPutAll: self className;
			nextPutAll: ' new'; cr.
		(self magritteDescription reject: #isReadOnly) do: [ :desc |
			| value |
			value := desc read: self.
			(desc isIgnorableValue: value) ifFalse: [ 
				desc accessor store: value inDescriptionOn: str ] ].
		str nextPutAll: 'yourself' ].
		
	formattedSource := (RBParser parseExpression: source) formattedCode.
	
	aStream << formattedSource
]
