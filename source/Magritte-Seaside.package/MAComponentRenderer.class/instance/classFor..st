private
classFor: aDescription
	| classes |
	classes := OrderedCollection withAll: aDescription currentCssClasses.
	(self hasError: aDescription)
		ifTrue: [ classes add: 'error' ].
	^ classes isEmpty
		ifFalse: [ classes reduce: [ :a :b | a , ' ' , b ] ]