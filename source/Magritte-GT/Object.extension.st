Extension { #name : 'Object' }

{ #category : '*Magritte-GT' }
Object >> exampleGtInspectorReadOnlyMagritteIn: composite [
	"<gtInspectorPresentationOrder: 300>"
	"A simple GT presentation. Disabled by default because we have one that shows the full editable form, but could be useful..."
	| table |
	table := composite table
		title: 'Magritte';
		display: [ self magritteDescription children collect: [ :desc |
			desc label -> (desc toString: (desc accessor read: self)) ] ];
		when: [ self magritteDescription notEmpty ];
		column: 'Field' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
]

{ #category : '*Magritte-GT' }
Object >> gtInspectorMagritteIn: composite [
	<gtInspectorPresentationOrder: 40>
	composite magritte
		title: 'Form';
		display: [ self ];
		when: [ self magritteDescription isContainer not or: [ self magritteDescription notEmpty ] ]
]
