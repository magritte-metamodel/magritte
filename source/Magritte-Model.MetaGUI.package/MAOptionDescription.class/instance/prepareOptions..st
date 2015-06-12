private
prepareOptions: aCollection
	^ self isSorted
		ifFalse: [ aCollection asArray ]
		ifTrue: [ 
			aCollection asArray
				sort: self sortBlock;
				yourself ]