*Magritte-Pharo3-Model
magritteEvaluatorClassFor: aClass
	"Answer an evaluator class appropriate for evaluating expressions in the 
	context of this class."
	
	^ aClass compilerClass