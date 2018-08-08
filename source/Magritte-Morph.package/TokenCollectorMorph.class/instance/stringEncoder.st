private-building
stringEncoder
	^ stringEncoder ifNil: [ stringEncoder := [ :obj | obj asString ] ]