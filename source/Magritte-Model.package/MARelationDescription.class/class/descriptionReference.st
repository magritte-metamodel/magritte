acessing-magritte
descriptionReference
	<magritteDescription>
	^ super descriptionReference
		classes: [ MAContainer withAllConcreteClasses ] magritteDynamicObject;
		beOptional;
		yourself