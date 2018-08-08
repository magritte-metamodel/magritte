accessing
refactoring
	^ MAMethodRefactoring
		model: self model
		swapMethod: self currentNode selector
		in: self currentNode theClass