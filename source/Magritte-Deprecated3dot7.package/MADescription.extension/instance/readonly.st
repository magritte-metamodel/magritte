*Magritte-Deprecated3dot7
readonly
	self 
		deprecated: 'Use #readOnly instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver readonly' 
						-> '`@receiver readOnly'.
		^ self readOnly