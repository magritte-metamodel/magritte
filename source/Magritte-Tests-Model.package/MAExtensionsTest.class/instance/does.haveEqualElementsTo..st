helpers
does: aCollection haveEqualElementsTo: anotherCollection
	aCollection size = anotherCollection size ifFalse: [ ^ false ].
	1 to: aCollection size do: [ :index |
		(aCollection at: index) = (anotherCollection at: index)
			ifFalse: [ ^ false ] ].
	
	^ true