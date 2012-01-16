exporting
exportOn: aStream
	self showHeader
		ifTrue: [ self exportHeaderOn: aStream ].
	self showBody
		ifTrue: [ self exportBodyOn: aStream ]