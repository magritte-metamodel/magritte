"
I am an abstract description for all basic description types.
"
Class {
	#name : #MAElementDescription,
	#superclass : #MADescription,
	#category : #'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MAElementDescription class >> defaultAutoAccept [
	^ false
]

{ #category : #'instance creation' }
MAElementDescription class >> new [
	"override #new so that we can create an object without adding it to the collection returned by: MAElementDescription withAllConcreteClasses,
	that is so we can call  MAElementDescription new magritteDescription  and it works as expected, which is used in MADescriptionEditor>>#buildReport .
	Yes it's a hack, but it works... (better ideas gratefully received)"
	^ self basicNew initialize
]

{ #category : #visiting }
MAElementDescription >> acceptMagritte: aVisitor [
	aVisitor visitElementDescription: self
]

{ #category : #converting }
MAElementDescription >> asContainer [
	^ MAContainer with: self
]

{ #category : #accessing }
MAElementDescription >> autoAccept [
	"Define whether new memento values should be automatically propagated to a model.
	
	New values are propagated to the model only if successfully validated. See {{gtMethod: GtMagritteMemento >> #autoAcceptValue: }} for more details."

	^ self 
		propertyAt: #autoAccept 
		ifAbsent: [ self class defaultAutoAccept ]
]

{ #category : #accessing }
MAElementDescription >> autoAccept: aBoolean [
	"Set whether new memento values should be automatically propagated to a model.
	
	New values are propagated to the model only if successfully validated. See {{gtMethod: GtMagritteMemento >> #autoAcceptValue: }} for more details."
	
	self propertyAt: #autoAccept put: aBoolean
]

{ #category : #accessing }
MAElementDescription >> default [
	^ self propertyAt: #default ifAbsent: [ self class defaultDefault ]
]

{ #category : #accessing }
MAElementDescription >> default: anObject [
	self propertyAt: #default put: anObject
]

{ #category : #accessing }
MAElementDescription >> definingContext [
	
	^ self propertyAt: #definingContext ifAbsent: [ nil ]
]

{ #category : #accessing }
MAElementDescription >> definingContext: anMADefiningContext [
	
	^ self propertyAt: #definingContext  put: anMADefiningContext
]

{ #category : #testing }
MAElementDescription >> handleMessage: aMessage for: anObject [
	"We do no error checking; you probably want to send #handlesSelector: first to make sure"
	^ aMessage numArgs = 0
		ifTrue: [ anObject readUsing: self ]
		ifFalse: [ anObject write: aMessage argument using: self ]
]

{ #category : #testing }
MAElementDescription >> handlesSelector: aSelector [
	^ self accessor handlesSelector: aSelector
]

{ #category : #'lazy initialization' }
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

{ #category : #'*magritte-model' }
MAElementDescription >> printFor: anObject on: aWriteStream [ 
	(self read: anObject) ifNotNil: [ :value | aWriteStream nextPutAll: (self toString: value) ]
]

{ #category : #printing }
MAElementDescription >> storeOn: aStream [
	aStream 
		nextPutAll: self className;
		nextPutAll: ' new'; cr.
	(self magritteDescription reject: #isReadOnly) do: [ :desc |
		| value |
		value := desc read: self.
		(value ~= desc default and: [ value isNotNil ]) ifTrue: [ 
			desc accessor store: value inDescriptionOn: aStream ] ].
	aStream nextPutAll: 'yourself'
]
