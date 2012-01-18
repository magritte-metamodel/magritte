private
build: anObject
	| selectors container |
	selectors := SortedCollection withAll: (anObject class allSelectors select: [ :each | each isDescriptionSelector ]).
	container := self build: anObject for: self containerSelector in: selectors.
	^ (selectors select: [ :each | each isDescriptionDefinition ])
		inject: (cache at: anObject put: container)
		into: [ :result :each |
			self containerSelector = each ifFalse: [
				| description |
				description := self build: anObject for: each in: selectors.
				description isDescription
					ifTrue: [ result add: description ] ].
			result ]