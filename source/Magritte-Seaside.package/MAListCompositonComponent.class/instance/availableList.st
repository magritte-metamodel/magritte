accessing
availableList
	^ self magritteDescription isDistinct
		ifFalse: [ super availableList ]
		ifTrue: [ super availableList copyWithoutAll: self selectedList ]