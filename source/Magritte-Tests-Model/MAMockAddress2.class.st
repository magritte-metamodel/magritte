Class {
	#name : #MAMockAddress2,
	#superclass : #MAMockAddress,
	#category : 'Magritte-Tests-Model-Mocks'
}

{ #category : #'acessing-magritte' }
MAMockAddress2 >> descriptionContainer [
	"this pragma #magritteContainer is optional as the pragma will be retrieved from the super class's overridden method."
	<magritteContainer>
	
	^ super descriptionContainer
		propertyAt: #addressContainerDerived put: nil;
		yourself
]

{ #category : #'acessing-magritte' }
MAMockAddress2 >> descriptionStreet [
	"this pragma #magritteDescription is optional as the pragma will be retrieved from the super class's overridden method."
	<magritteDescription>
	
	^ super descriptionStreet
		beRequired;
		yourself
]
