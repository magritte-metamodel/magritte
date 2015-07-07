enumeration
collect: aBlock
	| copy |
	copy := self copyEmpty.
	self do: [ :row :col :val |
		copy
			at: row at: col
			put: (aBlock value: row value: col value: val) ].
	^ copy