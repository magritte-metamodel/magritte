accessing-readonly
visibleColumns
	^ self columns select: [ :each | each isVisible ]