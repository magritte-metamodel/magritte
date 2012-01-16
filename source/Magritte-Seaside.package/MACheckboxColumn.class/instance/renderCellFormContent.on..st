rendering
renderCellFormContent: anObject on: html
	html checkbox
		value: (self isSelected: anObject);
		callback: [ :value | self selectRow: anObject value: value ]