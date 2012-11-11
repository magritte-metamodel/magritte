copying
postCopy
	| previous |
	super postCopy.
	previous := self contents.
	location := nil.
	self contents: previous