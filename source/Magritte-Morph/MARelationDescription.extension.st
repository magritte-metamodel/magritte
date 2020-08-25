Extension { #name : #MARelationDescription }

{ #category : #'*Magritte-Morph' }
MARelationDescription >> descriptionClassesWithMorphic: description [
	<magritteDescription: #descriptionClasses>
	^ description
			morphClass: MATokenCompletionMorph;
			yourself
]
