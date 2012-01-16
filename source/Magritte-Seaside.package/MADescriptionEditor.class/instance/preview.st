actions
preview
	self show: (self example asComponent
		addMessage: self description label;
		addValidatedForm;
		yourself)