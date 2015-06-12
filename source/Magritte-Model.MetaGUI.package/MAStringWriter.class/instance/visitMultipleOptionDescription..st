visiting-description
visitMultipleOptionDescription: aDescription
	self object isEmpty
		ifTrue: [ self stream nextPutAll: aDescription undefined ]
		ifFalse: [
			self object
				do: [ :each | self stream nextPutAll: (aDescription labelForOption: each) ]
				separatedBy: [ self stream nextPutAll: ', ' ] ]