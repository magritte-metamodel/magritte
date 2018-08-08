accessing
buildFrom: aDescription target: aTarget 
	self target: aTarget; visit: aDescription.
	^self builtDescription