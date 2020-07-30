*Magritte-Deprecated3dot7
isReadonly
	self 
		deprecated: 'Use #isReadOnly instead.' 
		on: '2020-01-23'
		in: #'v3.7'
		transformWith: '`@receiver isReadonly' 
						-> '`@receiver isReadOnly'.
	^ self isReadOnly