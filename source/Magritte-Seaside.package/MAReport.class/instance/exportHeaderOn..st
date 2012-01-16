exporting
exportHeaderOn: aStream
	self visibleColumns
		do: [ :each | each exportHeadOn: aStream ]
		separatedBy: [ aStream tab ].
	aStream nextPut: Character cr