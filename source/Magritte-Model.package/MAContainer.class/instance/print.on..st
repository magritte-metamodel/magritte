accessing
print: anObject on: aStream
	"Print the current values of all anObject's described fields. Customize the printing of a field with the #maPrintString property, which should store a valuable with the value of the field as an optional argument"
	self
		do: [ :d | 
			| value |
			value := d read: anObject.
			value ifNotNil: [ | stringValue |
				stringValue := d
					propertyAt: #maPrintString
					ifPresent: [ :map | map cull: value ]
					ifAbsent: [ d toString: value ].
				aStream nextPutAll: stringValue ] ]
		separatedBy: [ aStream space ]