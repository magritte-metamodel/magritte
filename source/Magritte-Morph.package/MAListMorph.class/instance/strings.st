accessing-dynamic
strings
	^ self options collect: [ :each | self description reference toString: each ]