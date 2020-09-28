Extension { #name : #Symbol }

{ #category : #'*magritte-deprecated' }
Symbol >> isDescriptionDefinition [
	"Answer wheter the receiver is a method selector following the naming conventions of a description definition."

	^ self isDescriptionSelector
		and: [ self isUnary ]
]

{ #category : #'*magritte-deprecated' }
Symbol >> isDescriptionExtension: aSelector [
	"Answer wheter the receiver is a method selector following the naming conventions of a description extension to aSelector."

	^ self isDescriptionSelector
		and: [ self numArgs = 1
		and: [ self beginsWith: aSelector ] ]
]

{ #category : #'*magritte-deprecated' }
Symbol >> isDescriptionSelector [
	"Answer wheter the receiver is a method selector following the naming conventions of a  description selector."

	^ self ~= #description
		and: [ self beginsWith: #description ]
]
