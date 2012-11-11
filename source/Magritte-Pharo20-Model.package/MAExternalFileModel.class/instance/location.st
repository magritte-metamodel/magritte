accessing-dynamic
location
	^ location ifNil: [ location := self uniqueLocation: self locationDefinition ]