acessing-magritte
descriptionContainer
	"this pragma #magritteContainer is optional as the pragma will be retrieved from the super class's overridden method."
	<magritteContainer>
	
	^ super descriptionContainer
		propertyAt: #addressContainerDerived put: nil;
		yourself