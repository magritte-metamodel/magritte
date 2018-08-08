private
sortRows: aCollection
	| result |
	result := SortedCollection new: aCollection size.
	result
		sortBlock: self sorter;
		addAll: aCollection.
	^ self isReversed
		ifFalse: [ result ]
		ifTrue: [ result reverse ]