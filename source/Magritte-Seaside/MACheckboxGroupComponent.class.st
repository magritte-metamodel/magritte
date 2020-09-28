"
Use for MAMultipleSelectionComponent. I display as many checkboxes as my description has options. Another representation for the same description is MAListCompositionComponent.
"
Class {
	#name : #MACheckboxGroupComponent,
	#superclass : #MAMultipleSelectionComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MACheckboxGroupComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MACheckboxGroupComponent >> hasLabelId [
	^ self isReadonly
]

{ #category : #testing }
MACheckboxGroupComponent >> isDistinct [
	^ true
]

{ #category : #private }
MACheckboxGroupComponent >> optionId: anInteger [ 
	^ self ajaxId: 'option' , anInteger greaseString
]

{ #category : #private }
MACheckboxGroupComponent >> optionsWithIndexDo: elementAndIndexBlock separatedBy: separatorBlock [
	| index |
	index := 1.
	self magritteDescription allOptions
		do: [ :each |
			elementAndIndexBlock value: each value: index.
			index := index + 1 ]
		separatedBy: separatorBlock
]

{ #category : #rendering }
MACheckboxGroupComponent >> renderEditorOn: html [
	html hiddenInput 
		callback: [ :value | self clear ].
	self
		optionsWithIndexDo: [ :each :index |
			| optionId |
			optionId := self optionId: index.
			html checkbox
				id: optionId;
				value: (self selectedList includes: each);
				onTrue: [ self add: each ] 
				onFalse: [ self remove: each ].
			html space.
			html label
				for: optionId;
				with: (self labelForOption: each) ]
		separatedBy: [ html break ]
]
