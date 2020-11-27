Class {
	#name : #MASingleSelectionComponent,
	#superclass : #MAOptionComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #accessing }
MASingleSelectionComponent >> options [
	^ self magritteDescription allOptionsWith: self value
]

{ #category : #rendering }
MASingleSelectionComponent >> renderViewerOn: html [
	html render: (self labelForOption: self value)
]
