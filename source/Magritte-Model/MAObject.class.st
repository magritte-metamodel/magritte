"
I provide functionality available to all Magritte objects. I implement a dictionary of properties, so that extensions can easily store additional data.
"
Class {
	#name : #MAObject,
	#superclass : #MABasicObject,
	#traits : 'MATPropertyOwner',
	#classTraits : 'MATPropertyOwner classTrait',
	#category : #'Magritte-Model-Core'
}

{ #category : #testing }
MAObject class >> isAbstract [
	^ true
]

{ #category : #'instance creation' }
MAObject class >> new [
	"Create a new instance of the receiving class and checks if it is concrete."

	self isAbstract
		ifTrue: [ self error: self name , ' is abstract.' ].
	^ super new
]

{ #category : #reflection }
MAObject class >> withAllConcreteClasses [
	^ Array streamContents: [ :stream |
		self withAllConcreteClassesDo: [ :each |
			stream nextPut: each ] ]
]

{ #category : #reflection }
MAObject class >> withAllConcreteClassesDo: aBlock [
	self withAllSubclassesDo: [ :each |
		each isAbstract ifFalse: [
			aBlock value: each ] ]
]

{ #category : #comparing }
MAObject >> = anObject [
	"Answer whether the receiver and the argument represent the same object. This default implementation checks if the species of the compared objects are the same, so that superclasses might call super before performing their own check. Also redefine the message ==#hash== when redefining this message."

	^ self species = anObject species
]

{ #category : #visiting }
MAObject >> acceptMagritte: aVisitor [
]

{ #category : #comparing }
MAObject >> hash [
	"Answer a SmallInteger whose value is related to the receiver's identity. Also redefine the message ==#= == when redefining this message."

	^ self species hash
]

{ #category : #copying }
MAObject >> postCopy [
	"This method is called whenever a shallow copy of the receiver is made. Redefine this method in subclasses to copy other fields as necessary. Never forget to call super, else class invariants might be violated."

	super postCopy.
	self postCopyProperties
]
