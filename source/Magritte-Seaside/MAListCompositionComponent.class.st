"
I'm, like MACheckboxComponent, a seaside component for MAMultipleSelectionDescription. I display two lists. In the first, all available options, in the other, what the user selected. 2 buttons in between to add and remove elements to/from the selected list. If the everything property is set, I display two more buttons to allow the user to add or remove all options in one click.
"
Class {
	#name : #MAListCompositionComponent,
	#superclass : #MAMultipleSelectionComponent,
	#instVars : [
		'availableSelected',
		'selectedSelected'
	],
	#category : #'Magritte-Seaside-Components'
}

{ #category : #testing }
MAListCompositionComponent class >> isAbstract [
	^ false
]

{ #category : #actions }
MAListCompositionComponent >> add [
	| added |
	self availableSelected isNil
		ifTrue: [ ^ self ].
	added := self availableSelected.
	self add: added.
	self selectedSelected: added.
	self magritteDescription isDistinct
		ifTrue: [ self availableSelected: nil ]
]

{ #category : #accessing }
MAListCompositionComponent >> availableList [
	^ self magritteDescription isDistinct
		ifFalse: [ super availableList ]
		ifTrue: [ super availableList copyWithoutAll: self selectedList ]
]

{ #category : #'accessing-properties' }
MAListCompositionComponent >> availableSelected [
	^ availableSelected
]

{ #category : #'accessing-properties' }
MAListCompositionComponent >> availableSelected: anObject [
	availableSelected := anObject
]

{ #category : #actions }
MAListCompositionComponent >> moveDown [
	self selectedSelected isNil
		ifFalse: [ self selectedList moveDown: self selectedSelected ]
]

{ #category : #actions }
MAListCompositionComponent >> moveUp [
	self selectedSelected isNil
		ifFalse: [ self selectedList moveUp: self selectedSelected ]
]

{ #category : #actions }
MAListCompositionComponent >> remove [
	self selectedSelected isNil
		ifTrue: [ ^ self ].
	self remove: self selectedSelected.
	self availableSelected: self selectedSelected.
	self selectedSelected: nil
]

{ #category : #'rendering-parts' }
MAListCompositionComponent >> renderEditorAvailableOn: html [
	html select
		size: 6; 
		style: 'width: 150px';
		list: self availableList;
		selected: self availableSelected;
		callback: [ :value | self availableSelected: value ];
		labels: [ :value | self labelForOption: value ]
]

{ #category : #'rendering-buttons' }
MAListCompositionComponent >> renderEditorButtonAddOn: html [
	html submitButton
		callback: [ self add ];
		text: '>>'.
	html break.
	html submitButton
		callback: [ self remove ];
		text: '<<'
]

{ #category : #'rendering-buttons' }
MAListCompositionComponent >> renderEditorButtonOrderOn: html [
	html submitButton
		callback: [ self moveUp ];
		text: 'up'.
	html break.
	html submitButton
		callback: [ self moveDown ];
		text: 'down'
]

{ #category : #rendering }
MAListCompositionComponent >> renderEditorOn: html [ 
	html table id: self labelId; with: [
		html tableRow: [
			html tableData: [ self renderEditorAvailableOn: html ].
			html tableData 
				style: 'vertical-align: center';
				with: [ self renderEditorButtonAddOn: html ].
			html tableData: [ self renderEditorSelectedOn: html ].
			self isOrdered ifTrue: [
				html tableData 
					style: 'vertical-align: center';
					with: [ self renderEditorButtonOrderOn: html ] ] ] ]
]

{ #category : #'rendering-parts' }
MAListCompositionComponent >> renderEditorSelectedOn: html [
	html select
		size: 6; 
		style: 'width: 150px';
		list: self selectedList;
		selected: self selectedSelected;
		callback: [ :value | self selectedSelected: value ];
		labels: [ :value | self labelForOption: value ]
]

{ #category : #'accessing-properties' }
MAListCompositionComponent >> selectedSelected [
	^ selectedSelected
]

{ #category : #'accessing-properties' }
MAListCompositionComponent >> selectedSelected: anObject [
	selectedSelected := anObject
]
