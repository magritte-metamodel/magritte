rendering
renderEditorOn: html
	html hiddenInput 
		callback: [ :value | self clear ].
	self
		optionsWithIndexDo: [ :each :index |
			| optionId |
			optionId := self optionId: index.
			html checkbox
				id: optionId;
				value: (self selectedList includes: each);
				onTrue: [ self add: each ] 
				onFalse: [ self remove: each ].
			html space.
			html label
				for: optionId;
				with: (self labelForOption: each) ]
		separatedBy: [ html break ]