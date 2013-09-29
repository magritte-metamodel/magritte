displaying
displayStringFor: anObject
	"Convert object to a string. If a block was passed to #display: use that, otherwise send #greaseString by default"

	^ displayBlock value: anObject.