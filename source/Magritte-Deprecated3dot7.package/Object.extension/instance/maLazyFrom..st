*Magritte-Deprecated3dot7
maLazyFrom: description
	self 
		deprecated: 'Renamed to #maLazyInstVarUsing: because now there is also #maLazyPropertyUsing:'
		transformWith: '`@receiver maLazyFrom: `@statements1' 
						-> '`@receiver maLazyInstVarUsing: `@statements1'.
	^ self maLazyInstVarUsing: description