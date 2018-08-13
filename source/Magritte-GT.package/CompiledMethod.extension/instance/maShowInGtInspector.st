*Magritte-GT
maShowInGtInspector
	
	| order |
	order := UIManager default request: 'Presentation Order' initialAnswer: 1 asString.
	order 
		ifNotNil: [ order := order asNumber ]
		ifNil: [ ^ self ].
		
	self maShowInGtInspectorOrder: order
