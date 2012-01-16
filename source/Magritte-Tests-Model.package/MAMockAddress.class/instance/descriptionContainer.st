acessing-magritte
descriptionContainer
	<magritteContainer>
	^ super descriptionContainer
		propertyAt: #addressContainerBase put: nil;
		yourself