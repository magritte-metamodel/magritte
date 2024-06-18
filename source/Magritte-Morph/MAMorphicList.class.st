Class {
	#name : #MAMorphicList,
	#superclass : #MAMorphicElement,
	#category : #'Magritte-Morph-Model'
}

{ #category : #'accessing-dynamic' }
MAMorphicList >> options [
	^ self magritteDescription allOptions
]

{ #category : #'accessing-dynamic' }
MAMorphicList >> strings [
	^ self options collect: [ :each | self magritteDescription reference toString: each ]
]
