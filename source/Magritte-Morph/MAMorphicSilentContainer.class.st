"
The only difference to the superclass is that on answer it does not delete the morph. This is useful when we want the morph to be embedded.
"
Class {
	#name : #MAMorphicSilentContainer,
	#superclass : #MAMorphicContainer,
	#category : #'Magritte-Morph-Model'
}

{ #category : #answering }
MAMorphicSilentContainer >> answer: anObject [
	answerBlock isNil
		ifFalse: [ answerBlock value: anObject ].
]
