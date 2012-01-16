rendering-tools
renderSelectListOn: html
	self classes size > 1 ifTrue: [
		html select
			list: self classes;
			selected: self selected;
			callback: [ :value | self selected: value ];
			labels: [ :value | value label ] ].
	self classes notEmpty
		ifTrue: [ self renderSelectButtonOn: html ]