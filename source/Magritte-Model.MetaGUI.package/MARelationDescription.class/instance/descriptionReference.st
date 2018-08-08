acessing-magritte
descriptionReference
	<magritteDescription>
	^ super descriptionReference
		classes: MAContainer withAllConcreteClasses;
		beOptional;
		yourself