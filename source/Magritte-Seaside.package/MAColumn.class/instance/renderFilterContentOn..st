rendering
renderFilterContentOn: html
	self isFiltered 
		ifFalse: [ ^ self ].
	html form style: 'margin: 0; border: 0; padding: 0;'; with: [
		html select
			beOptional;
			beSubmitOnChange;
			optionalLabel: '(all)';
			labels: self formatter;
			list: self uniqueValues;
			selected: (self propertyAt: #filterValue ifAbsent: [ nil ]);
			callback: [ :value |
				value isNil
					ifTrue: [ self properties removeKey: #filterValue ifAbsent: [ ] ]
					ifFalse: [ self propertyAt: #filterValue put: value ].
				self report refresh ] ]