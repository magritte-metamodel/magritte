accessing
options
	^ options ifNil: [ options := self class defaultOptions ]