accessing
string: aString
	(self magritteDescription isObfuscated: aString)
		ifFalse: [ super string: aString ]