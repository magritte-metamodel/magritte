rendering-parts
renderEditorSelectedOn: html
	html select
		size: 6; 
		style: 'width: 150px';
		list: self selectedList;
		selected: self selectedSelected;
		callback: [ :value | self selectedSelected: value ];
		labels: [ :value | self labelForOption: value ]