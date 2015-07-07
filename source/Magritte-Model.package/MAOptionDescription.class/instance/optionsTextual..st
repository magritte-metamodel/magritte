accessing-textual
optionsTextual: aString
	| lines |
	lines := (aString ifNil: [ String new ]) lines.
	^ self options: (self reference fromStringCollection: lines)