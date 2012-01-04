tests
testKind
	self assert: (self accessor class = MAChainAccessor).
	self assert: (self accessor next class = MASelectorAccessor).
	self assert: (self accessor accessor class = MAChainAccessor).
	self assert: (self accessor accessor next class = MASelectorAccessor).
	self assert: (self accessor accessor accessor class = MASelectorAccessor)