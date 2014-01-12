private
displayCurrentValue

	| displayString |
	displayString := description displayStringFor: self value.
	self currentValueMorph contents: displayString.