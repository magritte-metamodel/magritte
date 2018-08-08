accessing
buildFrom: aDescription target: aTarget model: aModel
	^ self new 
		target: aTarget;
		model: aModel;
		visit: aDescription;
		builtDescription