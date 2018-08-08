*magritte-deprecated
isDescriptionSelector
	"Answer wheter the receiver is a method selector following the naming conventions of a  description selector."

	^ self ~= #description
		and: [ self beginsWith: #description ]