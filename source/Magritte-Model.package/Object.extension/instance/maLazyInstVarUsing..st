*Magritte-Model
maLazyInstVarUsing: description
	"Return the current value of a field as specified by its description. See #lazilyInitializeFrom:for: comment for more info.
		- NB: Only works with a selector accessor with matching inst var name e.g. (readSelector = instVarName = #myField). It could be extended to other cases if the need arises."

	| currentValue |
	currentValue := self instVarNamed: description accessor readSelector.
	^ description lazilyInitializeFrom: currentValue for: self.