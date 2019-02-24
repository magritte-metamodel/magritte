accessing
selector: aValuable
		self 
		deprecated: 'Renamed to #action: because now accepts any valuable as an action (e.g. aBlock).'
		on: '10/24/2017'
		in: #Pharo61
		transformWith: '`@receiver selector: `@arg' 
						-> '`@receiver action: `@arg'.

	self action: aValuable.