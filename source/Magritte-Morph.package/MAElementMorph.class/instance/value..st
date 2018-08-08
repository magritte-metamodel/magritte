accessing
value: anObject
	self memento write: anObject using: self magritteDescription.
	self changed: #value