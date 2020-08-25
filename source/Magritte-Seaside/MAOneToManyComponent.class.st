Class {
	#name : #MAOneToManyComponent,
	#superclass : #MARelationComponent,
	#instVars : [
		'report',
		'commandColumn'
	],
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MAOneToManyComponent class >> isAbstract [
	^ false
]

{ #category : #actions }
MAOneToManyComponent >> add [
	self root 
		show: (self validatedFormOn: self selected new)
		onAnswer: [ :result |
			result isNil
				ifFalse: [ self value: (self value copyWith: result); refresh ] ]

]

{ #category : #private }
MAOneToManyComponent >> buildCommandColumn [
	|retVal|
	retVal := MACommandColumn new setReport: self report.
	self magritteDescription isDefinitive ifFalse: [
		retVal
			addCommandOn: self selector: #edit: text: 'edit';
			addCommandOn: self selector: #remove: text: 'remove' ].
	self magritteDescription isOrdered ifTrue: [
		retVal
			addCommandOn: self selector: #up: text: 'up';
			addCommandOn: self selector: #down: text: 'down' ].
	^ retVal
]

{ #category : #private }
MAOneToManyComponent >> buildReport [
	^ (MAReport rows: self value description: self reference)
		sortEnabled: self magritteDescription isOrdered not;
		yourself
]

{ #category : #accessing }
MAOneToManyComponent >> children [
	^ Array with: self report
]

{ #category : #accessing }
MAOneToManyComponent >> commandColumn [
	^ commandColumn ifNil: [ commandColumn := self buildCommandColumn ]
]

{ #category : #actions }
MAOneToManyComponent >> down: anElement [
	self value moveDown: anElement
]

{ #category : #actions }
MAOneToManyComponent >> edit: anObject [
	self root 
		call: (self validatedFormOn: anObject forOperation: 'Edit')
		onAnswer: [ :answer | self refresh ]
]

{ #category : #actions }
MAOneToManyComponent >> refresh [
	self report rows: self value
]

{ #category : #actions }
MAOneToManyComponent >> remove: anObject [
	self value: (self value copyWithout: anObject).
	self refresh
]

{ #category : #rendering }
MAOneToManyComponent >> renderEditorOn: html [
	self renderViewerOn: html.
	self magritteDescription isDefinitive
		ifFalse: [ self renderSelectListOn: html ]
]

{ #category : #'rendering-buttons' }
MAOneToManyComponent >> renderSelectButtonOn: html [
	html submitButton on: #add of: self
]

{ #category : #rendering }
MAOneToManyComponent >> renderViewerOn: html [
	| columns |
	columns := self report columns
		copyWithout: self commandColumn.
	self report columns: (self isReadonly
		ifFalse: [ columns copyWith: self commandColumn ]
		ifTrue: [ columns ]).
	html render: self report
]

{ #category : #accessing }
MAOneToManyComponent >> report [
	^ report ifNil: [ report := self buildReport ]
]

{ #category : #actions }
MAOneToManyComponent >> up: anElement [
	self value moveUp: anElement
]

{ #category : #private }
MAOneToManyComponent >> validatedFormOn: result [
	^ self validatedFormOn: result forOperation: 'Add'
]

{ #category : #private }
MAOneToManyComponent >> validatedFormOn: result forOperation: aString [
	^ result asComponent
		addMessage: aString , ' ' , self selected label;
		addValidatedForm;
		yourself
]
