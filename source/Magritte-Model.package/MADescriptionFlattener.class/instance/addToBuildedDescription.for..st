visiting
addToBuildedDescription: aDescription for: aValue
	"aValue is the intermediate value that can be processed by further expansion"
	aDescription canExpand
		ifTrue: [ self expandDescription: aDescription for: aValue ]
		ifFalse: [ builtDescription add: aDescription ]