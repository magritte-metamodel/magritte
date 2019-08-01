*Magritte-Developer
instVarBoilerplateFromDescriptions
	self new magritteDescription do: [ :e | 
		| varName refactoring |
		varName := e accessor readSelector.
		(self hasInstVarNamed: varName) 
			ifFalse: [ self addInstVarNamed: varName ].
		refactoring := RBCreateAccessorsForVariableRefactoring
					variable: varName
					class: self
					classVariable: false.
		refactoring execute ]