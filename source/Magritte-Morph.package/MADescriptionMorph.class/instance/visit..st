private
visit: anObject
	
	| visitor |
	visitor := self visitorClass on: self.
	visitor visit: anObject