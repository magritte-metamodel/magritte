accessing-dynamic
selector: aSelector 
	self readSelector: aSelector asSymbol.
	self writeSelector: (aSelector greaseString copyWith: $:) asSymbol