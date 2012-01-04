accessing-textual
columnLabelsTextual
	^ (MAStringDescription new toStringCollection: self columnLabels)
		asMultilineString