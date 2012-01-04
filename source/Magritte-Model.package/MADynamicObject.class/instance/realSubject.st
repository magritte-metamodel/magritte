accessing
realSubject
	^ GRPlatform current
		magritteEvaluate: super realSubject
		onUnhandledErrorDo: [ :err | err return: nil ]