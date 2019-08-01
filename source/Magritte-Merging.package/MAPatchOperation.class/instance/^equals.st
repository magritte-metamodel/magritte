comparing
= rhs
	self species = rhs species ifFalse: [ ^ false ].
	^ self receiver = rhs receiver and: [ self field = rhs field and: [ self oldValue = rhs oldValue and: [ self newValue = rhs newValue ] ] ]