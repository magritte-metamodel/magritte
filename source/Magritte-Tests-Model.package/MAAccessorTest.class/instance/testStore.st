tests-identity
testStore
	| evaluator |
	evaluator := GRPlatform current
		magritteEvaluatorClassFor: self actualClass.
	self
		assert:
			(evaluator new
				source: self accessor storeString;
				evaluate) = self accessor