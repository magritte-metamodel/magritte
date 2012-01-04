tests-enumerating
testDo
	table do: [ :row :col :val | self assert: (row raisedTo: col) = val ]