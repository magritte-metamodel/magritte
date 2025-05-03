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
	^ RBCondition true
]

{ #category : #transforming }
MADescriptionRenameRefactoring >> transform [
	self privateTransform
]

{ #category : #transforming }
MADescriptionRenameRefactoring >> privateTransform [
	| parseTree |
	parseTree := class parseTreeFor: #description.
	parseTree selector: #magritteDescription.
	class compile: (parseTree formattedCode) classified: 'acessing-magritte'.
	class removeMethod: #description.
]
