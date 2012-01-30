accessing
refactoring
	^ MAPackageRefactoring model: self model classes: (self currentNode classes collect: [ :each | each theClass name ])