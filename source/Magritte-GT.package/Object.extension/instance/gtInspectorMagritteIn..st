*Magritte-GT
gtInspectorMagritteIn: composite
	<gtInspectorPresentationOrder: 40>
	composite magritte
		title: 'Form';
		display: [ self ];
		when: [ self magritteDescription isContainer not or: [ self magritteDescription notEmpty ] ]