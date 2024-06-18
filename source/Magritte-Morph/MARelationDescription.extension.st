Extension { #name : 'MARelationDescription' }

{ #category : '*Magritte-Morph' }
MARelationDescription >> descriptionClassesWithMorphic: description [
	<magritteDescription: #descriptionClasses>
	^ description
			morphicClass: MAMorphicTokenCompletion;
			yourself
]
