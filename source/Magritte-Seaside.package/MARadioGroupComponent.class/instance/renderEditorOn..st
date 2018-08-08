rendering
renderEditorOn: html
	| group |
	group := html radioGroup.
	html span
		id: self labelId;
		with: [
			self
				optionsWithIndexDo: [ :each :index |
					self
						renderOption: each
						index: index
						in: group
						on: html ]
				separatedBy: [ html break ] ]