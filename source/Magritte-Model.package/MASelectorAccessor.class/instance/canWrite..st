testing
canWrite: aModel
	^ self writeSelector notNil and: [ aModel respondsTo: self writeSelector ]