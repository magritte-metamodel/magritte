Class {
	#name : #MADateInputComponent,
	#superclass : #MATextInputComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #actions }
MADateInputComponent >> choose [
	| calendar |
	calendar := WAMiniCalendar new.
	calendar
		date: ((self value notNil
			and: [ self magritteDescription isSatisfiedBy: self value ])
				ifFalse: [ Date current ]
				ifTrue: [ self value ]);
		selectBlock: [ :value | calendar answer: value ];
		canSelectBlock: [ :value | self magritteDescription isSatisfiedBy: value ].
	self chooser: calendar
]

{ #category : #rendering }
MADateInputComponent >> renderButtonOn: html [
	html submitButton on: #choose of: self
]

{ #category : #actions }
MADateInputComponent >> today [
	| calendar |
	calendar := WAMiniCalendar new.
	calendar
		date: ((self value notNil
			and: [ self magritteDescription isSatisfiedBy: self value ])
				ifFalse: [ Date current ]
				ifTrue: [ self value ]);
		selectBlock: [ :value | calendar answer: value ];
		canSelectBlock: [ :value | self magritteDescription isSatisfiedBy: value ].
	self chooser: calendar
]
