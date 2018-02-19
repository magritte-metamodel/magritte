asserting
should: aBlock raiseSingle: aClass 
	self should: aBlock raiseSingle: aClass withExceptionDo: [ :e | ]