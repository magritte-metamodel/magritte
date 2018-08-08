*magritte-deprecated
isDescriptionExtension: aSelector
	"Answer wheter the receiver is a method selector following the naming conventions of a description extension to aSelector."

	^ self isDescriptionSelector
		and: [ self numArgs = 1
		and: [ self beginsWith: aSelector ] ]