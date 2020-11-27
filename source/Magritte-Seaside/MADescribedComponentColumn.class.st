"
This column uses the component of a description to render the cell value.
"
Class {
	#name : #MADescribedComponentColumn,
	#superclass : #MADescribedColumn,
	#instVars : [
		'component'
	],
	#category : 'Magritte-Seaside-Report'
}

{ #category : #readme }
MADescribedComponentColumn >> NOW [
	" very experimental ... use only if you're willing to fix bugs
	  this only works for readonly views without callbacks
	  on the positive side: only one component per column is created "
]

{ #category : #accessing }
MADescribedComponentColumn >> component [
	component isNil ifTrue: [
		component := self magritteDescription componentClass new
			setDescription: self magritteDescription;
			yourself ].
	^component
]

{ #category : #rendering }
MADescribedComponentColumn >> renderCellContent: anObject on: html [
	self component setMemento: (anObject mementoClass
			model: anObject
			description: self magritteDescription asContainer).
	self component renderViewerOn: html
]
