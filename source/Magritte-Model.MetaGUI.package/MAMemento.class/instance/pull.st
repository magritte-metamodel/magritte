private
pull
	"Utility method to pull the model into a dictionary mapping descriptions to values. nil values are replaced with the default ones of the model."

	| result |
	result := self pullRaw.
	result keysAndValuesDo: [ :key :value |
		value isNil
			ifTrue: [ result at: key put: key default yourself ] ].
	^ result