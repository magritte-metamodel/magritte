private-building
textInput

	textInput ifNotNil: [ ^ textInput ].
	textInput := TextInputFieldModel new
		entryCompletion: self entryCompletion;
		acceptBlock: [ :text | self accept: text ];
		buildWithSpec.
	textInput
		vResizing: #rigid;
		height: textInput textFont height + (textInput borderWidth * 2).
	^ textInput