Class {
	#name : #MAMultiselectListComponent,
	#superclass : #MAMultipleSelectionComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #testing }
MAMultiselectListComponent class >> isAbstract [
	^ false
]

{ #category : #testing }
MAMultiselectListComponent >> isDistinct [
	^ true
]

{ #category : #rendering }
MAMultiselectListComponent >> renderEditorOn: html [
	html multiSelect
		size: 8;
		id: self labelId;
		list: self availableList;
		selected: self selectedList;
		labels: [ :value | self labelForOption: value ];
		callback: [ :value | self value: value ]
]
