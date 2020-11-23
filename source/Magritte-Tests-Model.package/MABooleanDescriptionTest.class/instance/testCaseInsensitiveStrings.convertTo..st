private
testCaseInsensitiveStrings: aCollection convertTo: aBoolean
	| lowercaseStrings uppercaseStrings |
	lowercaseStrings := aCollection.
	uppercaseStrings := lowercaseStrings collect: [ :e | e asUppercase ].
	lowercaseStrings, uppercaseStrings do: [ :e | 
		self assert: (self description fromString: e) = aBoolean ]