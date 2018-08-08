*Magritte-GT
glmPresentation: aBlock
	| wrapper |
	wrapper := [ :composite :context :subject |
		| presentation |
		presentation := aBlock cull: composite cull: context.
		self glmCustomizePresentation: presentation for: subject ].
	self propertyAt: #glmPresentation put: wrapper