visiting
visit: aDescription
	"Only visit objects that are visible and that can be changed."
	
	(aDescription isVisible and: [ aDescription isReadonly not ])
		ifTrue: [ super visit: aDescription ].
	