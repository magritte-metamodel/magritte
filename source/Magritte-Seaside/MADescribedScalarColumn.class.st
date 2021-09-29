Class {
	#name : #MADescribedScalarColumn,
	#superclass : #MADescribedColumn,
	#category : 'Magritte-Seaside-Report'
}

{ #category : #rendering }
MADescribedScalarColumn >> renderCellContent: anObject on: html [
	html render: (self magritteDescription reference toString: (self valueFor: anObject))
]

{ #category : #actions }
MADescribedScalarColumn >> valueFor: aRow [
	^aRow
]
