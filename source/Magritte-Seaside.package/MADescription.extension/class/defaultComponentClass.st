*magritte-seaside-defaults
defaultComponentClass
	^ self defaultComponentClasses isEmpty
		ifTrue: [ MAUndefinedComponent ]
		ifFalse: [ self defaultComponentClasses first ]