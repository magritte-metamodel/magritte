accessors
selectorAccessor: aSelector
	"Uses ==aSelector== to read from the model."

	self accessor: (MASelectorAccessor selector: aSelector)