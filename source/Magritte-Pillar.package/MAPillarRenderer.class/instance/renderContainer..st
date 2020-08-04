private-rendering
renderContainer: aDescription
	self
		push: PRTable new
		do: [ 
			self add: (self rowOfText: self object printString).
			aDescription isEmpty ifTrue: [ ^ self ].
			self
				push: { PRTableRow new. PRTableCell new. PRTable new }
				do: [ self visitAll: (aDescription select: [ :each | each isVisible ]) ] ]