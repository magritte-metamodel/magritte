accessing-properties
readonly: aBoolean
	self 
		deprecated: 'Use #readOnly: instead.' 
		on: '2020-11-27'
		in: #'v3.7'
		transformWith: '`@receiver readonly:' 
						-> '`@receiver readOnly:'.
		^ self readOnly: aBoolean