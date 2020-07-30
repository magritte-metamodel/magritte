*Magritte-Deprecated3dot7
beReadonly
	self 
		deprecated: 'Use #beReadOnly instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver beReadonly' 
						-> '`@receiver beReadOnly'.
		^ self beReadOnly