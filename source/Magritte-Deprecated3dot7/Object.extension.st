Extension { #name : #Object }

{ #category : #'*Magritte-Deprecated3dot7' }
Object >> maLazyFrom: description [
	self 
		deprecated: 'Renamed to #maLazyInstVarUsing: because now there is also #maLazyPropertyUsing:'
		transformWith: '`@receiver maLazyFrom: `@statements1' 
						-> '`@receiver maLazyInstVarUsing: `@statements1'.
	^ self maLazyInstVarUsing: description
]

{ #category : #'*Magritte-Deprecated3dot7' }
Object >> magritteActionDescriptions [
	self 
		deprecated: 'Renamed to #magritteActions for ease of use and also slightly more accurate (see new method comment'
		transformWith: '`@receiver magritteActionDescriptions' 
						-> '`@receiver magritteActions'.
	^ self magritteActions
]
