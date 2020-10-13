*Magritte-Deprecated3dot7
magritteActionDescriptions
	self 
		deprecated: 'Renamed to #magritteActions for ease of use and also slightly more accurate (see new method comment'
		transformWith: '`@receiver magritteActionDescriptions' 
						-> '`@receiver magritteActions'.
	^ self magritteActions