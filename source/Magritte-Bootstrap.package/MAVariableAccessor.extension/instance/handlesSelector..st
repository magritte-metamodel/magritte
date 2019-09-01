*Magritte-Bootstrap
handlesSelector: aSelector
	| readSelector |
	readSelector := aSelector trimRight: [ :c | c = $: ].
	^ readSelector = self name