private
onValidationError: aBlock addTo: aCollection
	^ [ aBlock
		on: MAMultipleErrors do: [ :err | aCollection addAll: err collection ] ]
		on: MAValidationError do: [ :err | aCollection add: err ]