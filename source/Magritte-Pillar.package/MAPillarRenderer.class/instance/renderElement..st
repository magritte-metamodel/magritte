private-rendering
renderElement: aDescription
	"aDescription group = group
		ifFalse: [ self renderGroup: aDescription ]."

	self
		push: PRTableRow new
		do: [ 
			self renderLabel: aDescription.
			self renderControl: aDescription ]