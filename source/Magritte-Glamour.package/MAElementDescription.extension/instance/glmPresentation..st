*Magritte-Glamour
glmPresentation: aValuable
	"aValuable:
		- Return value: a Glamour presentaion; FYI a default title, label, and selection actions will be added automatically by Magritte (see #glmCustomizePresentation:for:).
		- Arguments (all optional) 
				- composite - the container presentation
				- context - e.g. an Inspector
				- subject - the object being visualized
		- To disable the presentation, make aValuable = `nil`"
	self propertyAt: #glmPresentation put: aValuable