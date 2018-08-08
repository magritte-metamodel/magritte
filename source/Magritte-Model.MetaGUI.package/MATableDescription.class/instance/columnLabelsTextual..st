accessing-textual
columnLabelsTextual: aString
	self columnLabels: (MAStringDescription new fromStringCollection: aString lines)