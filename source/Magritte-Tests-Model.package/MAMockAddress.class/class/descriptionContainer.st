description-container
descriptionContainer
	<magritteContainer>
	^ super descriptionContainer
		propertyAt: #addressContainerBase put: nil;
		yourself