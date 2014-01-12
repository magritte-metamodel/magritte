private
add: anObject
	| rowParent lastRowIndex newRow |
	rowParent := morph submorphs second.
	newRow := MAElementRow for: anObject of: self.
	lastRowIndex := rowParent submorphs findLast: [ :e | e isKindOf: MAElementRow ].
	lastRowIndex = 0 
		ifTrue: [ rowParent addMorph: newRow ]
		ifFalse: [ rowParent 
			addMorph: newRow 
			after: (rowParent submorphs at: lastRowIndex) ].