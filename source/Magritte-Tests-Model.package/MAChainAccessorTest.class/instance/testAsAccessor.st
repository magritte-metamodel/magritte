tests
testAsAccessor
	super testAsAccessor.
	
	accessor := #(value) asAccessor.
	self assert: (accessor isKindOf: MASelectorAccessor).
	self assert: (accessor selector = #value).
	
	accessor := #(value contents) asAccessor.
	self assert: (accessor isKindOf: MAChainAccessor).
	self assert: (accessor next isKindOf: MASelectorAccessor).
	self assert: (accessor next selector = #value).
	self assert: (accessor accessor isKindOf: MASelectorAccessor).
	self assert: (accessor accessor selector = #contents)