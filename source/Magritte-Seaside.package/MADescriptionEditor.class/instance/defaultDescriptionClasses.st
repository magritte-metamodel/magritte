accessing-configuration
defaultDescriptionClasses
	^ OrderedCollection new
		add: MAStringDescription;
		add: MAMemoDescription;
		add: MASymbolDescription;
		add: MAPasswordDescription;
		add: nil;
		add: MABooleanDescription;
		add: MASingleOptionDescription;
		add: MAMultipleOptionDescription;
		add: MAToOneRelationDescription;
		add: MAToManyRelationDescription;
		add: nil;
		add: MANumberDescription;
		add: MADurationDescription;
		add: MADateDescription;
		add: MATimeDescription;
		add: MATimeStampDescription;
		add: nil;
		add: MAColorDescription;
		add: MATokenDescription;
		add: nil;
		add: MAFileDescription;
		add: MAClassDescription;
		add: MATableDescription;
		yourself