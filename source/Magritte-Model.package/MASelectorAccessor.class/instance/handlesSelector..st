testing
handlesSelector: aSelector
	^ aSelector = self readSelector or: [ aSelector = self writeSelector ]