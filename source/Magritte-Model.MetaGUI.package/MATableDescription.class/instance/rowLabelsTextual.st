accessing-textual
rowLabelsTextual
	^ (MAStringDescription new toStringCollection: self rowLabels)
		asMultilineString