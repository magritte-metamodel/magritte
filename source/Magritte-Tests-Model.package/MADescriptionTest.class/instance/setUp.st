running
setUp
	super setUp.
	description := self descriptionInstance.
	self assert: description accessor notNil