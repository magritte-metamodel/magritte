accessing
at: aKey ifAbsent: aBlock
	^ aKey = #value 
		ifTrue: [ value ]
		ifFalse: [ aBlock value ]