tests
testDescription
	| baseDescription derivedDescription |
	
	baseDescription := baseModel magritteDescription detect: [ :each | each accessor selector = #street ].
	self assert: baseDescription isRequired not.
	
	derivedDescription := derivedModel magritteDescription detect: [ :each | each accessor selector = #street ].
	self assert: derivedDescription isRequired.	
	