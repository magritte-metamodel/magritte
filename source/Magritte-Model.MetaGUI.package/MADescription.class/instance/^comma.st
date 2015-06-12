operators
, aDescription
	"Concatenate the receiver and ==aDescription== to one composed description. Answer a description container containing both descriptions."

	^ self asContainer copy
		addAll: aDescription asContainer;
		yourself