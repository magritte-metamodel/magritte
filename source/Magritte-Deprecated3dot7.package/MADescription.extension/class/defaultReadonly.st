*Magritte-Deprecated3dot7
defaultReadonly
	self 
		deprecated: 'Use #defaultReadOnly instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver defaultReadonly' 
						-> '`@receiver defaultReadOnly'.
	^ self defaultReadOnly