*Magritte-GT
maShowInGtInspector
	
	| order nodes newPragmaNode |
	order := UIManager default request: 'Presentation Order' initialAnswer: 1 asString.
	order 
		ifNotNil: [ order := order asNumber ]
		ifNil: [ ^ self ].
		
	self maShowInGtInspectorOrder: order