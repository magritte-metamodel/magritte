"
I display a set of radio buttons to render MASingleSelectionDescription.
"
Class {
	#name : #MARadioGroupComponent,
	#superclass : #MASingleSelectionComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MARadioGroupComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MARadioGroupComponent >> hasLabelId [
	^ self isReadonly not
]

{ #category : #private }
MARadioGroupComponent >> optionId: anInteger [ 
	^ self ajaxId: 'option' , anInteger greaseString
]

{ #category : #private }
MARadioGroupComponent >> optionsWithIndexDo: elementAndIndexBlock separatedBy: separatorBlock [
	| index |
	index := 1.
	self options
		do: [ :each |
			elementAndIndexBlock value: each value: index.
			index := index + 1 ]
		separatedBy: separatorBlock
]

{ #category : #rendering }
MARadioGroupComponent >> renderEditorOn: html [
	| group |
	group := html radioGroup.
	html span
		id: self labelId;
		with: [
			self
				optionsWithIndexDo: [ :each :index |
					self
						renderOption: each
						index: index
						in: group
						on: html ]
				separatedBy: [ html break ] ]
]

{ #category : #rendering }
MARadioGroupComponent >> renderOption: anObject index: anInteger in: aRadioGroup on: html [
	| optionId |
	optionId := self optionId: anInteger.
	html radioButton
		id: optionId;
		group: aRadioGroup;
		selected: self value = anObject;
		callback: [ self value: anObject ].
	html space.
	html label
		for: optionId;
		with: (self labelForOption: anObject)
]
