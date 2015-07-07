accessors
propertyAccessor: aSelector
	"Uses ==aSelector== to read from the property dictionary of the model."

	self accessor: ((MAChainAccessor on: #properties) 
		accessor: (MADictionaryAccessor key: aSelector))