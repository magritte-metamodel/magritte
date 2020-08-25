Class {
	#name : #MAToggleColumn,
	#superclass : #MADescribedColumn,
	#category : 'Magritte-Seaside-Report'
}

{ #category : #rendering }
MAToggleColumn >> renderCellContent: anObject on: html [
	| value |
	value := self valueFor: anObject.
	html anchor
		callback: [ anObject write: value not using: self magritteDescription ];
		with: (self magritteDescription toString: value)
]
