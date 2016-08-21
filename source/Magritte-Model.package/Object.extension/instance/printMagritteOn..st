*Magritte-Model
printMagritteOn: aStream
	"Print the current values of all described fields"
	
	self magritteDescription
		do: [ :d | 
			| value |
			value := d read: self.
			value ifNotNil: [ 
				| stringValue |
				stringValue := d toString: value.
				aStream nextPutAll: stringValue ] ]
		separatedBy: [ aStream space ]