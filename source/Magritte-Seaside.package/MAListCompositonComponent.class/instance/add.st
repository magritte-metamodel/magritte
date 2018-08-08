actions
add
	| added |
	self availableSelected isNil
		ifTrue: [ ^ self ].
	added := self availableSelected.
	self add: added.
	self selectedSelected: added.
	self magritteDescription isDistinct
		ifTrue: [ self availableSelected: nil ]