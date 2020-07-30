visiting
visit: aDescription
	"Only visit objects that are visible and that can be changed."
	
	(aDescription isVisible and: [ aDescription isReadOnly not ])
		ifTrue: [ super visit: aDescription ].
	