private
tryValidation: tryBlock ifPass: passBlock
	| shouldContinue |
	shouldContinue := true.
	tryBlock on: MAValidationError do: [ :e | shouldContinue := false. e pass ].
	shouldContinue ifFalse: [ ^ self ].
	passBlock value