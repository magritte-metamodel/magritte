private
filterRows: aCollection
	| filters filter |
	filters := OrderedCollection new.
	self hasRowFilter
		ifTrue: [ filters add: self rowFilter ].
	self columns do: [ :each |
		each isFiltered ifTrue: [
			filter := each filterBlock.
			filter isNil
				ifFalse: [ filters add: filter ] ] ].
	^ filters isEmpty
		ifTrue: [ aCollection ]
		ifFalse: [ aCollection select: [ :row | filters allSatisfy: [ :block | block value: row ] ] ]