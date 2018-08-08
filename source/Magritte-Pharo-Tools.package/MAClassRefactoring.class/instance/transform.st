transforming
transform
	self descriptionMethodRename.
	self refactorings do: [ :each | self performComponentRefactoring: each ]