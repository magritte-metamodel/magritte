Class {
	#name : #MADescriptionEditor,
	#superclass : #MAExampleEditor,
	#instVars : [
		'example',
		'selected',
		'selectedComponent'
	],
	#category : 'Magritte-Seaside-Examples'
}

{ #category : #initialization }
MADescriptionEditor class >> initialize [
	WAAdmin register: self asApplicationAt: 'magritte/editor'
]

{ #category : #'actions-items' }
MADescriptionEditor >> addDescription: aDescription [
	self
		show: (self buildEditorFor: aDescription titled: 'Add ' , aDescription class label)
		onAnswer: [ :element | element isNil ifFalse: [ self appendDescription: element ] ]
]

{ #category : #'actions-items' }
MADescriptionEditor >> appendDescription: aDescription [
	self magritteDescription add: aDescription.
	self refresh

]

{ #category : #private }
MADescriptionEditor >> buildReport [
	^ (MAReport rows: self magritteDescription children description: MAElementDescription new magritteDescription)
		addColumn: (MAColumn new
			accessor: #( magritteDescription label );
			label: 'Kind';
			yourself);
		addColumn: (MACommandColumn new
			addCommandOn: self selector: #editDescription: text: 'edit';
			addCommandOn: self selector: #moveUp: text: 'up';
			addCommandOn: self selector: #moveDown: text: 'down';
			addCommandOn: self selector: #removeDescription: text: 'remove';
			yourself);
		yourself
]

{ #category : #rendering }
MADescriptionEditor >> children [
	^super children copyWith: selectedComponent
]

{ #category : #'accessing-configuration' }
MADescriptionEditor >> defaultDescription [
	^ MAContainer new
]

{ #category : #'accessing-configuration' }
MADescriptionEditor >> defaultDescriptionClasses [
	^ OrderedCollection new
		add: MAStringDescription;
		add: MAMemoDescription;
		add: MASymbolDescription;
		add: MAPasswordDescription;
		add: nil;
		add: MABooleanDescription;
		add: MASingleOptionDescription;
		add: MAMultipleOptionDescription;
		add: MAToOneRelationDescription;
		add: MAToManyRelationDescription;
		add: nil;
		add: MANumberDescription;
		add: MADurationDescription;
		add: MADateDescription;
		add: MATimeDescription;
		add: MATimeStampDescription;
		add: nil;
		add: MAColorDescription;
		add: MATokenDescription;
		add: nil;
		add: MAFileDescription;
		add: MAClassDescription;
		add: MATableDescription;
		yourself
]

{ #category : #'accessing-configuration' }
MADescriptionEditor >> defaultExampleInstance [
	^ MAAdaptiveModel description: self magritteDescription
]

{ #category : #'actions-items' }
MADescriptionEditor >> editDescription: aDescription [
	self
		show: (self
			buildEditorFor: aDescription
			titled: 'Edit ' , aDescription class label)
		onAnswer: [ self refresh ]
]

{ #category : #accessing }
MADescriptionEditor >> example [
	^ example ifNil: [ example := self defaultExampleInstance ]
]

{ #category : #initialization }
MADescriptionEditor >> initialize [
	super initialize.
	selected :=  MADescriptionHolder new.
	selectedComponent := selected asComponent

]

{ #category : #actions }
MADescriptionEditor >> preview [
	self show: (self example asComponent
		addMessage: self magritteDescription label;
		addValidatedForm;
		yourself)
]

{ #category : #'actions-items' }
MADescriptionEditor >> removeDescription: aDescription [
	self magritteDescription remove: aDescription.
	self refresh
]

{ #category : #rendering }
MADescriptionEditor >> renderButtonsOn: html [
	html submitButton
		callback: [
			selectedComponent save.
			selected contents isNil
				ifFalse: [ self addDescription: selected contents new ] ];
		text: 'Add'.
	super renderButtonsOn: html
]
