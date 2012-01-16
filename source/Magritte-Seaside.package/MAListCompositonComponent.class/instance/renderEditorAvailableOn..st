rendering-parts
renderEditorAvailableOn: html
	html select
		size: 6; 
		style: 'width: 150px';
		list: self availableList;
		selected: self availableSelected;
		callback: [ :value | self availableSelected: value ];
		labels: [ :value | self labelForOption: value ]