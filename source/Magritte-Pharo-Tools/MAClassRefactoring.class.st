Class {
	#name : #MAClassRefactoring,
	#superclass : #RBClassRefactoring,
	#category : 'Magritte-Pharo-Tools'
}

{ #category : #transforming }
MAClassRefactoring >> descriptionMethodRename [
	| class |
	class := self classObjectFor: className asSymbol.
        (class selectors anySatisfy: [ :each | each = #description ]) ifTrue: [
		self generateChangesFor: (MADescriptionRenameRefactoring forClass: class) ]
]

{ #category : #preconditions }
MAClassRefactoring >> preconditions [
	^ RBCondition true
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
MAClassRefactoring >> privateTransform [
	self descriptionMethodRename.
	self refactorings do: [ :each | self generateChangesFor: each ]
]

{ #category : #transforming }
MAClassRefactoring >> transform [
	self privateTransform
]
