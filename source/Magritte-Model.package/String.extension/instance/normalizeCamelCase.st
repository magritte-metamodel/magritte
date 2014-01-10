*magritte-model
normalizeCamelCase

	^ String streamContents: [ :out |
		self do: [ :e |
			(e isUppercase and: [ out position > 0 ]) ifTrue: [ out nextPut: Character space ].
			out nextPut: e ] ]