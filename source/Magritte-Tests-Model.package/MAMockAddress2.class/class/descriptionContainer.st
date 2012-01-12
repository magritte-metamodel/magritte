description-container
descriptionContainer
	"<magritteContainer> - the pragma is deliberately commented out. Why? As the base class defines this pragma
	we don't need to include it - the normal rules of derived class method overriding apply. We find the pragma in a base class
	and call the method on the target object.
	However it does no harm to include the pragma, if you want."
	^ super descriptionContainer
		propertyAt: #addressContainerDerived put: nil;
		yourself