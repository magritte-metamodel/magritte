Class {
	#name : #MADescriptionRenameRefactoring,
	#superclass : #RBMethodRefactoring,
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #initialization }
MADescriptionRenameRefactoring class >> forClass: class [
	^ self new
		class: class
		yourself
]

{ #category : #accessing }
MADescriptionRenameRefactoring >> class: aClass [
	class := aClass
]

{ #category : #preconditions }
MADescriptionRenameRefactoring >> preconditions [
	^ RBCondition empty
]

{ #category : #transforming }
MADescriptionRenameRefactoring >> transform [
	| selector target parseTree |
	parseTree := class parseTreeFor: #description.
	parseTree selector: #magritteDescription.
	class compile: (parseTree formattedCode) classified: 'acessing-magritte'.
	class removeMethod: #description.
]
