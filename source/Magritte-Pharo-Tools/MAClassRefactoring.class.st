Class {
	#name : #MAClassRefactoring,
	#superclass : #RBClassRefactoring,
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #transforming }
MAClassRefactoring >> descriptionMethodRename [
	| class |
	class := self classObjectFor: className asSymbol.
	(class selectors detect: [ :each | each = #description ] ifNone: [ nil ]) notNil ifTrue: [
		self performComponentRefactoring: (MADescriptionRenameRefactoring forClass: class) ]
]

{ #category : #preconditions }
MAClassRefactoring >> preconditions [
	^ RBCondition empty
]

{ #category : #accessing }
MAClassRefactoring >> refactorings [
	| class |
	class := self theClass.
	^  class selectors select: #isDescriptionSelector thenCollect: [ :each |
			MAMethodRefactoring
				model: self model
				swapMethod: each
				in: class ]
]

{ #category : #accessing }
MAClassRefactoring >> theClass [
	| class |
	class := self classObjectFor: className asSymbol.
	^ class isMeta ifFalse: [ class theMetaClass ] ifTrue: [ class ]
]

{ #category : #transforming }
MAClassRefactoring >> transform [
	self descriptionMethodRename.
	self refactorings do: [ :each | self performComponentRefactoring: each ]
]
