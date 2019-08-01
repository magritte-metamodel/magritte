accessing
reactOnAnswerFor: aValue
	self update.
	^ answerBlock glamourValue:
		(aValue asGlamorousMultiValue, 
		self asGlamorousMultiValue, 
		self entity asGlamorousMultiValue)