accessing-properties
readOnly
	^ readonly ifNil: [ readonly := false ]