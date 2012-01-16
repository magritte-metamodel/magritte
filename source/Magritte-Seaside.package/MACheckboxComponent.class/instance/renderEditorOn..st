rendering
renderEditorOn: html
	html label: [
		html checkbox
			id: self labelId;
			disabled: self isReadonly;
			on: #value of: self.
		html space; render: self description checkboxLabel ]