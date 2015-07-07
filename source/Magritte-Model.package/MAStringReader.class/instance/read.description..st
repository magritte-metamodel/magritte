visiting
read: aStream description: aDescription
	(aStream atEnd or: [ self nextMatchAll: aDescription undefined on: aStream ])
		ifTrue: [ ^ nil ].
	^ super read: aStream description: aDescription