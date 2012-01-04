tests-enumerating
testCollect
	table := table collect: [ :row :col :val | row + col + val ].
	table do: [ :row :col :val | self assert: (row raisedTo: col) = (val - row - col) ]