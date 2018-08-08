exporting
exportContent: anObject index: aNumber on: aStream
	| string |
	string := (self formatter value: anObject) collect: [ :char | 
		char isSeparator
			ifTrue: [ Character space ]
			ifFalse: [ char ] ].
	aStream nextPutAll: string