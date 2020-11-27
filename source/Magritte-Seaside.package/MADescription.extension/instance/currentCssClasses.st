*magritte-seaside-accessing
currentCssClasses
	| classes |
	classes := OrderedCollection withAll: self cssClasses.
	self isReadOnly
		ifTrue: [ classes add: 'readonly' ].
	self isRequired
		ifTrue: [ classes add: 'required' ].
	^classes