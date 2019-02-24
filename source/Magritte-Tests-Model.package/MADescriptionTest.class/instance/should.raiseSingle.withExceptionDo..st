asserting
should: aBlock raiseSingle: aClass withExceptionDo: exceptionBlock
	self should: aBlock
		raise: MAMultipleErrors
		withExceptionDo: [ :e | 
			self assert: e collection size equals: 1.
			e collection first isKindOf: aClass.
			exceptionBlock value: e collection first ].