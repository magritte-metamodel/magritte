accessing-description
descriptionReference	
	<magritte>
	^ super descriptionReference
		classes: [ MAContainer withAllConcreteClasses ] magritteDynamicObject;
		beOptional;
		yourself