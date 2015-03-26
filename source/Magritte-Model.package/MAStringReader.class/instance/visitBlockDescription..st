visiting-description
visitBlockDescription: aDescription
	| block |
	block := Compiler evaluate: self contents.
	self object: block