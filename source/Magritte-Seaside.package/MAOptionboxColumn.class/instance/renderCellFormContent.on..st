rendering
renderCellFormContent: anObject on: html
	html radioButton
		group: (self radioGroupFor: html);
		selected: (self isSelected: anObject);
		callback: [ self selectRow: anObject ]