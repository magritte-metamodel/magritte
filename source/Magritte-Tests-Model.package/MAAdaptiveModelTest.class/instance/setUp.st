running
setUp
	scaffolder := MAAdaptiveModel new.
	scaffolder magritteDescription
		add: MAStringDescription new;
		add: MANumberDescription new.
	scaffolder write: 'foo' using: self descriptions first.
	scaffolder write: 123 using: self descriptions second