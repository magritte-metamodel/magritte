testing
isReadonly
	self 
		deprecated: 'Use #isReadOnly instead.' 
		on: '2020-11-27'
		in: #'v3.7'
		transformWith: '`@receiver isReadonly' 
						-> '`@receiver isReadOnly'.
	^ self isReadOnly