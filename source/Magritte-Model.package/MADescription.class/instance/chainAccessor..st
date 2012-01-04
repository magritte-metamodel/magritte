accessors
chainAccessor: anArray
	"Uses ==anArray== of selectors to read from the model."

	self accessor: (MAChainAccessor accessors: anArray)