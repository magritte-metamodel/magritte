*Magritte-GT
gtPresentation: aBlock
	| wrapper |
	wrapper := [ :composite :context :subject |
		| presentation |
		presentation := aBlock cull: composite cull: context.
		presentation hasTitle ifFalse: [ presentation title: self label ].
		presentation hasTransformation ifFalse: [ presentation display: (self accessor read: subject) ] ].
	self propertyAt: #gtPresentation put: wrapper