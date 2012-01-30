*magritte-deprecated
isDescriptionDefinition
	"Answer wheter the receiver is a method selector following the naming conventions of a description definition."

	^ self isDescriptionSelector
		and: [ self isUnary ]