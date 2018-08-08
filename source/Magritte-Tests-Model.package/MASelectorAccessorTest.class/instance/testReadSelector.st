tests
testReadSelector
	self accessor readSelector: #contents.

	self assert: self accessor selector = #contents.
	self assert: self accessor readSelector = #contents.
	self assert: self accessor writeSelector = #value: