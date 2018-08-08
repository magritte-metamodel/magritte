testing
canRead: aModel
	^ self readSelector notNil and: [ aModel respondsTo: self readSelector ]