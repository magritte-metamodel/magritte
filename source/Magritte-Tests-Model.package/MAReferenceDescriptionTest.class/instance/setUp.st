running
setUp
	super setUp.
	self description reference: self referenceInstance.
	self assert: self description reference accessor notNil