tests
testWriteSelector
	self accessor writeSelector: #contents:.

	self assert: self accessor selector = #value.
	self assert: self accessor readSelector = #value.
	self assert: self accessor writeSelector = #contents: