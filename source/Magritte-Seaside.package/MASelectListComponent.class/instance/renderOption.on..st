rendering-grouped
renderOption: option on: html
	^ html option
		selected: self value = option;
		callback: [ self value: option ];
		with: (self labelForOption: option)