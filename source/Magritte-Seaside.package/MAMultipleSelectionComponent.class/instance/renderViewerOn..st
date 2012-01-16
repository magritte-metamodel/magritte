rendering
renderViewerOn: html
	html unorderedList
		id: self labelId;
		list: self selectedList;
		labels: [ :each | self labelForOption: each ]