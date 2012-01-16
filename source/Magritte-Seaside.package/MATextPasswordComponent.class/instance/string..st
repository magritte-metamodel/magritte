accessing
string: aString
	(self description isObfuscated: aString)
		ifFalse: [ super string: aString ]