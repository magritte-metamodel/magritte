rendering
renderHeadCellOn: html
	html tableHeading
		title: self comment;
		class: self sorterStyle;
		class: self tableHeadingClass;
		with: [
			self isSortable
				ifFalse: [ self renderHeadContentOn: html ]
				ifTrue: [
					html anchor
	 					callback: [ self report sort: self ];
						with: [ self renderHeadContentOn: html ] ] ]