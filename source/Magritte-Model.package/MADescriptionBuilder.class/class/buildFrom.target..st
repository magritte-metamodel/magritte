accessing
buildFrom: aDescription target: aTarget
	^ self new 
		target: aTarget;
		visit: aDescription;
		builtDescription