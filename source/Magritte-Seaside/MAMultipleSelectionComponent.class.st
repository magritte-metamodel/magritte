"
I provide basic functionalities for MAListCompositionComponent and MACheckboxGroupComponent.
"
Class {
	#name : #MAMultipleSelectionComponent,
	#superclass : #MAOptionComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #actions }
MAMultipleSelectionComponent >> add: anObject [
	(self isDistinct and: [ self value includes: anObject ])
		ifFalse: [ self value: (self value copyWith: anObject) ]
]

{ #category : #accessing }
MAMultipleSelectionComponent >> availableList [
	^ self magritteDescription allOptions
]

{ #category : #actions }
MAMultipleSelectionComponent >> clear [
	self value: self value copyEmpty
]

{ #category : #testing }
MAMultipleSelectionComponent >> hasLabelId [
	^ true
]

{ #category : #testing }
MAMultipleSelectionComponent >> isDistinct [
	^ self magritteDescription isDistinct
]

{ #category : #testing }
MAMultipleSelectionComponent >> isOrdered [
	^ self magritteDescription isOrdered
		and: [ (self value respondsTo: #moveUp:)
		and: [ self value respondsTo: #moveDown: ] ]
]

{ #category : #actions }
MAMultipleSelectionComponent >> remove: anObject [
	self value: (self isDistinct
		ifTrue: [ self value copyWithout: anObject ]
		ifFalse: [ self value copyWithoutFirstOccurrenceOf: anObject ])
]

{ #category : #rendering }
MAMultipleSelectionComponent >> renderViewerOn: html [
	html unorderedList
		id: self labelId;
		list: self selectedList;
		labels: [ :each | self labelForOption: each ]
]

{ #category : #accessing }
MAMultipleSelectionComponent >> selectedList [
	^ self value
]

{ #category : #accessing }
MAMultipleSelectionComponent >> value [
	^ super value ifNil: [ self value: Array new. super value ]
]
