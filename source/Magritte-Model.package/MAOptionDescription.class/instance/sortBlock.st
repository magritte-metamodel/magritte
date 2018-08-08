private
sortBlock
	^ [ :a :b | (self reference toString: a) caseInsensitiveLessOrEqual: (self reference toString: b) ]