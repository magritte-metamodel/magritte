*magritte-pharo-model
magritteEvaluate: aBlock onUnhandledErrorDo: errorBlock
	"Evaluate aBlock. If an Error is signaled and is not handled higher up the
	stack, evaluate errorBlock with the Error instead of opening a debugger."
	
	"Apparently allowing #on:do: to be inlined by the compiler is faster than
	passing errorBlock directly in as a parameter."
	^ aBlock
		on: UnhandledError
		do: [ :error | errorBlock value: error ]