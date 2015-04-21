accessing
string: aString
	| value |
	value := self magritteDescription fromString: aString greaseString.
	self value: value; changed: #string