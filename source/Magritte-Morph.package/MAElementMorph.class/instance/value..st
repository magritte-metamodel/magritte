accessing
value: anObject
	self memento write: anObject using: self description.
	self changed: #value