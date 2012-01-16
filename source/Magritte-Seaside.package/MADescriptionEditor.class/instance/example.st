accessing
example
	^ example ifNil: [ example := self defaultExampleInstance ]