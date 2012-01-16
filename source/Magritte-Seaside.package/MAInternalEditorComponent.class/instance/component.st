accessing
component
	^ component ifNil: [ component := self buildComponent ]