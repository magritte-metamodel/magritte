acessing-magritte
descriptionContainerFoo: aDescription
	<magritteContainer>
	^ aDescription
		propertyAt: #foo put: nil;
		yourself