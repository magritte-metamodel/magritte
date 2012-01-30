accessing
refactorings
	| class |
	class := self theClass.
	^  class selectors select: #isDescriptionSelector thenCollect: [ :each |
			MAMethodRefactoring
				model: self model
				swapMethod: each
				in: class ]