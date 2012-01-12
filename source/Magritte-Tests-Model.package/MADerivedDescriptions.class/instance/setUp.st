running
setUp
	super setUp.
	MADescriptionBuilder default flush.
	
	baseModel := MAMockAddress new.
	derivedModel := MAMockAddress2 new. 