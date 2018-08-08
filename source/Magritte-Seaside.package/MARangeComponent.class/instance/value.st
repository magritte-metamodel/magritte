accessing
value
	^ ((super value ifNil: [ 0 ]) - self min) * 100 / self range