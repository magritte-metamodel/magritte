visiting
visitContainer: aContainer
	builtDescription := aContainer copy.
	builtDescription removeAll.
	aContainer do: [ :each |
		self visit: each copy ]