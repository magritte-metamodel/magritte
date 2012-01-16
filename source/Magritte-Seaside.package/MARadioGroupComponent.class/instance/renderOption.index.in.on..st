rendering
renderOption: anObject index: anInteger in: aRadioGroup on: html
	| optionId |
	optionId := self optionId: anInteger.
	html radioButton
		id: optionId;
		group: aRadioGroup;
		selected: self value = anObject;
		callback: [ self value: anObject ].
	html space.
	html label
		for: optionId;
		with: (self labelForOption: anObject)