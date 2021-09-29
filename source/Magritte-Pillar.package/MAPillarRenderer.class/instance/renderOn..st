private-rendering
renderOn: aPRDocumentItem
	self pillarStack push: aPRDocumentItem.
	self visit: self objectDescription