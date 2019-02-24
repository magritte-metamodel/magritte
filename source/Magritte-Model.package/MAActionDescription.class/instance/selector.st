accessing
selector
	self 
		deprecated: 'Renamed to #action because now accepts any valuable as an action (e.g. aBlock).'
		on: '10/24/2017'
		in: #Pharo61
		transformWith: '`@receiver selector' 
						-> '`@receiver action'.
	^ self action