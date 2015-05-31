*Magritte-GT
gtInspectorReadOnlyMagritteIn: composite
	<gtInspectorPresentationOrder: 300>
	| table |
	table := composite table
		title: 'Magritte';
		display: [ self magritteDescription children collect: [ :desc |
			desc label -> (desc toString: (desc accessor read: self)) ] ];
		column: 'Field' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value