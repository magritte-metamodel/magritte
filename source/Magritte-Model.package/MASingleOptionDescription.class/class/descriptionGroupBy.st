accessing-descriptions
descriptionGroupBy
	<magritte>
	^ MASymbolDescription new
		selectorAccessor: #groupBy;
		label: 'Grouped by';
		priority: 260;
		default: nil;
		yourself