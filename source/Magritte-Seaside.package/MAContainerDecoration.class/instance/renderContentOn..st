rendering
renderContentOn: html
	html form
		class: 'magritte';
		multipart: self requiresMultipartForm;
		defaultAction: [ self execute: self default ];
		with: [
			super renderContentOn: html.
			self renderButtonsOn: html ]