description-container
descriptionContainer
	<magritteContainer> 
	"the pragma above is optional as the pragma will be retrieved from the super class's overridden method."
	
	^ super descriptionContainer
		propertyAt: #addressContainerDerived put: nil;
		yourself