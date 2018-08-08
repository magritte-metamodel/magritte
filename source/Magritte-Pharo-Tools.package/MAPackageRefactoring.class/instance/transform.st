transforming
transform
	self classes 
		collect: [ :each | MAClassRefactoring model: self model className: each ]
		thenDo: [ :each | self performComponentRefactoring: each ]