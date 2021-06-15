Class {
	#name : #MAPatchOperation,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'field',
		'oldValue',
		'newValue',
		'isEnabled'
	],
	#category : #'Magritte-Merging'
}

{ #category : #examples }
MAPatchOperation class >> example [
	| desc |
	desc := MAContainer samplePersonDescription.
	^ MAPatchOperation for: MAContainer samplePersonHarryPotter set: desc children first to: 'Harry James Potter'
]

{ #category : #examples }
MAPatchOperation class >> example2 [
	| desc |
	desc := MAContainer samplePersonDescription.
	^ MAPatchOperation for: MAContainer samplePersonHarryPotter set: desc children second to: 'Godric''s Hollow, England'
]

{ #category : #examples }
MAPatchOperation class >> for: anObject set: aDescription to: anotherObject [
	^ self new
		receiver: anObject; 
		field: aDescription;
		newValue: anotherObject;
		yourself
]

{ #category : #comparing }
MAPatchOperation >> = rhs [
	self species = rhs species ifFalse: [ ^ false ].
	^ self receiver = rhs receiver and: [ self field = rhs field and: [ self oldValue = rhs oldValue and: [ self newValue = rhs newValue ] ] ]
]

{ #category : #accessing }
MAPatchOperation >> asElement [
	^ BlElement new
		layout: (BlLinearLayout horizontal cellSpacing: 10);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		addChild:
			(BrCheckbox new
				aptitude: BrGlamorousCheckboxAptitude;
				checked: self isEnabled;
				when: BrCheckboxChanged do: [ :evt | self isEnabled: evt isChecked ]);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: (self field label , ':') asRopedText);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: self oldValue displayString asRopedText;
				addEventHandlerOn: BlClickEvent
					do: [ :evt | evt target phlow spawnObject: self oldValue ]);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: ' > ' asRopedText);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: self newValue displayString asRopedText;
				addEventHandlerOn: BlClickEvent
					do: [ :evt | evt target phlow spawnObject: self newValue ]);
		yourself
]

{ #category : #accessing }
MAPatchOperation >> cacheOldValue [
	(self receiver isNil or: [ self field isNil ]) ifTrue: [ ^ self ].
	self oldValue: (self receiver readUsing: self field)
]

{ #category : #accessing }
MAPatchOperation >> children [
	^ #()
]

{ #category : #'as yet unclassified' }
MAPatchOperation >> diffStrings [
	^ { self field label, ': ', self oldValue asString. self field label, ': ', self newValue asString }
]

{ #category : #execution }
MAPatchOperation >> execute [
	self isEnabled ifFalse: [ ^ self ].
	self field accessor write: newValue to: receiver
]

{ #category : #accessing }
MAPatchOperation >> field [
	^ field
]

{ #category : #accessing }
MAPatchOperation >> field: anObject [
	field := anObject.
	self cacheOldValue
]

{ #category : #accessing }
MAPatchOperation >> gtElementViewFor: aView [
	<gtView>
	^ aView explicit stencil: [ self asElement ]
]

{ #category : #comparing }
MAPatchOperation >> hash [
	^ ((self receiver hash bitXor: self field hash) bitXor: self oldValue hash) bitXor: self newValue hash
]

{ #category : #accessing }
MAPatchOperation >> isEnabled [
	^ isEnabled ifNil: [ true ]
]

{ #category : #accessing }
MAPatchOperation >> isEnabled: aBoolean [
	isEnabled := aBoolean
]

{ #category : #accessing }
MAPatchOperation >> isNoOp [
	^ self oldValue = self newValue
]

{ #category : #accessing }
MAPatchOperation >> newValue [
	^ newValue
]

{ #category : #accessing }
MAPatchOperation >> newValue: anObject [
	newValue := anObject
]

{ #category : #accessing }
MAPatchOperation >> oldValue [
	^ oldValue 
]

{ #category : #accessing }
MAPatchOperation >> oldValue: anObject [
	oldValue := anObject
]

{ #category : #accessing }
MAPatchOperation >> operations [
	^ { self }
]

{ #category : #printing }
MAPatchOperation >> printOn: aStream [

	aStream
		nextPutAll: 'Change ';
		nextPutAll: field label;
		nextPutAll: ' from ';
		print: self oldValue;
		nextPutAll: ' to ';
		print: newValue
]

{ #category : #accessing }
MAPatchOperation >> receiver [
	^ receiver
]

{ #category : #accessing }
MAPatchOperation >> receiver: anObject [
	receiver := anObject.
	self cacheOldValue
]

{ #category : #execution }
MAPatchOperation >> undo [
	self field accessor write: oldValue to: receiver
]
