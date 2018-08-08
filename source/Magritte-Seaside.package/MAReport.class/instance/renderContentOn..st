rendering
renderContentOn: html
	html table
		id: self ajaxId; class: 'report';
		with: [ self renderTableOn: html ]