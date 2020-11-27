rendering
renderEditorOn: html
	html label: [
		html checkbox
			id: self labelId;
			disabled: self isReadOnly;
			on: #value of: self.
		html space; render: self magritteDescription checkboxLabel ]