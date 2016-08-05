*Magritte-Model
printMagritteOn: aStream
	self fieldDescriptions
		do: [ :d | 
			| value |
			value := d read: self.
			value ifNotNil: [ 
				| stringValue |
				stringValue := d toString: value.
				aStream nextPutAll: stringValue ] ]
		separatedBy: [ aStream space ]