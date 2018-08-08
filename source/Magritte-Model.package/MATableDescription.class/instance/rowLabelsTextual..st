accessing-textual
rowLabelsTextual: aString
	self rowLabels: (MAStringDescription new fromStringCollection: aString lines)