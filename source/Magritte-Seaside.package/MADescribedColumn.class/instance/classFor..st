accessing
classFor: aDescription
	| classes |
	classes := OrderedCollection withAll: aDescription currentCssClasses.
	^ classes isEmpty ifFalse: [ classes reduce: [ :a :b | a , ' ' , b ] ]