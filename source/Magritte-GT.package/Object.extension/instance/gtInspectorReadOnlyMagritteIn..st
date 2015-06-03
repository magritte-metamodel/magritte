*Magritte-GT
gtInspectorReadOnlyMagritteIn: composite
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