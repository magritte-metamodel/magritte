"
I am a description of a single option, possible values are stored within the ==options== field, but I might also be extensible so that the user can add its own option. My visual representation could be a drop-down list or a group of option-buttons.
"
Class {
	#name : #MASingleOptionDescription,
	#superclass : #MAOptionDescription,
	#category : 'Magritte-Model-Description'
}

{ #category : #'accessing-defaults' }
MASingleOptionDescription class >> defaultExtensible [
	^ false
]

{ #category : #testing }
MASingleOptionDescription class >> isAbstract [
	^ false
]

{ #category : #accessing }
MASingleOptionDescription class >> label [
	^ 'Single-Option'
]

{ #category : #visiting }
MASingleOptionDescription >> acceptMagritte: aVisitor [
	aVisitor visitSingleOptionDescription: self
]

{ #category : #actions }
MASingleOptionDescription >> beExtensible [
	self extensible: true
]

{ #category : #actions }
MASingleOptionDescription >> beLimited [
	self extensible: false
]

{ #category : #'acessing-magritte' }
MASingleOptionDescription >> descriptionExtensible [
	<magritteDescription>
	^ MABooleanDescription new
		accessor: #extensible;
		label: 'Extensible';
		priority: 250;
		default: self class defaultExtensible;
		yourself
]

{ #category : #'acessing-magritte' }
MASingleOptionDescription >> descriptionGroupBy [
	<magritteDescription>
	^ MASymbolDescription new
		selectorAccessor: #groupBy;
		label: 'Grouped by';
		priority: 260;
		default: nil;
		yourself
]

{ #category : #'accessing-properties' }
MASingleOptionDescription >> extensible [
	^ self propertyAt: #extensible ifAbsent: [ self class defaultExtensible ]
]

{ #category : #'accessing-properties' }
MASingleOptionDescription >> extensible: aBoolean [
	self propertyAt: #extensible put: aBoolean
]

{ #category : #'accessing-properties' }
MASingleOptionDescription >> groupBy [
	^ self propertyAt: #groupBy ifAbsent: [ nil ]
]

{ #category : #'accessing-properties' }
MASingleOptionDescription >> groupBy: anAccessor [
	"anAccessor to be sent to the options objects for getting their group."
	
	self propertyAt: #groupBy put: anAccessor asAccessor
]

{ #category : #testing }
MASingleOptionDescription >> isExtensible [
	^ self extensible
]

{ #category : #testing }
MASingleOptionDescription >> isGrouped [
	^ self groupBy notNil
]

{ #category : #private }
MASingleOptionDescription >> prepareOptions: aCollection [
	^ self isRequired
		ifTrue: [ super prepareOptions: aCollection ]
		ifFalse: [ (Array with: nil) , (super prepareOptions: aCollection) ]
]

{ #category : #'accessing-dynamic' }
MASingleOptionDescription >> shouldNotInclude: anObject [
	^ self isExtensible not or: [ super shouldNotInclude: anObject ]
]

{ #category : #validating }
MASingleOptionDescription >> validateKind: anObject [
	super validateKind: anObject.
	(self options includes: anObject)
		ifTrue: [ ^ self ].
	self isExtensible
		ifTrue: [ self reference validate: anObject ]
		ifFalse: [ MAKindError description: self signal: self kindErrorMessage ]
]
