tests
testExtension
	| description |
	description := MAMockAddress new magritteDescription
		detect: [ :each | each accessor selector = #place ].
	self assert: description isRequired.
	self assert: description isVisible not