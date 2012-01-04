*magritte-model
magritteEvaluate: aBlock onUnhandledErrorDo: errorBlock
	"Evaluate aBlock. If an Error is signaled and is not handled higher up the
	stack, evaluate errorBlock with the Error instead of opening a debugger."
	
	self subclassResponsibility