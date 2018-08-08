*magritte-seaside-accessing
currentCssClasses
	| classes |
	classes := OrderedCollection withAll: self cssClasses.
	self isReadonly
		ifTrue: [ classes add: 'readonly' ].
	self isRequired
		ifTrue: [ classes add: 'required' ].
	^classes