*Magritte-Bootstrap
handlesSelector: aSelector
	^ aSelector = self readSelector or: [ aSelector = self writeSelector ]