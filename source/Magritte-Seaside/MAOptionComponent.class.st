Class {
	#name : #MAOptionComponent,
	#superclass : #MAElementComponent,
	#category : 'Magritte-Seaside-Components'
}

{ #category : #private }
MAOptionComponent >> labelForOption: anObject [
	^ self magritteDescription labelForOption: anObject
]
