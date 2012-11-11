private
uniqueLocation: aLocationDefinition
	"Finds an unique path to be used and create the necessary sub directories."

	| valid result directory definition |
	valid := false.
	result := Array new: aLocationDefinition size.
	[ valid ] whileFalse: [
		directory := self baseDirectory ensureDirectory.
		result keysAndValuesDo: [ :index :value |
			definition := aLocationDefinition at: index.
			result at: index put: ((String new: definition first)
				collect: [ :each | definition second atRandom ]).
			directory := directory / (result at: index).
			directory exists ifFalse: [
				directory ensureDirectory.
				valid := true ] ] ].
	^ result