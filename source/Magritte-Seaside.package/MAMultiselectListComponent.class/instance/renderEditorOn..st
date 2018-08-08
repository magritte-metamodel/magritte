rendering
renderEditorOn: html
	html multiSelect
		size: 8;
		id: self labelId;
		list: self availableList;
		selected: self selectedList;
		labels: [ :value | self labelForOption: value ];
		callback: [ :value | self value: value ]