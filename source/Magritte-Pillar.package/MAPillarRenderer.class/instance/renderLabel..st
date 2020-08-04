private-rendering
renderLabel: aDescription
	aDescription hasLabel ifFalse: [ ^ self ].
	"label := html label.
	(self childAt: aDescription) hasLabelId
		ifTrue: [ label for: (self childAt: aDescription) labelId ].
	label with: [ html render: aDescription label; text: ':' ]"
	self add: (PRTableCell new add: (PRText content: aDescription label, ':'); yourself )