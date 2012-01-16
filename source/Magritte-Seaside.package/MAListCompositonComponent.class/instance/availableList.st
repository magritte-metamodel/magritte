accessing
availableList
	^ self description isDistinct
		ifFalse: [ super availableList ]
		ifTrue: [ super availableList copyWithoutAll: self selectedList ]