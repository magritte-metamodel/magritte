accessing-dynamic
strings
	^ self options collect: [ :each | self magritteDescription reference toString: each ]