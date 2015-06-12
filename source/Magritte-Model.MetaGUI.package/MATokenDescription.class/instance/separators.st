accessing
separators
	^ separators ifNil: [ separators := self class defaultSeparators ]