groups
groupChoice
	^ Set new
		add: MABooleanDescription;
		add: MASingleOptionDescription;
		add: MAMultipleOptionDescription;
		add: MAToOneRelationDescription;
		add: MAToManyRelationDescription;
		add: MAToManyScalarRelationDescription;		
		yourself