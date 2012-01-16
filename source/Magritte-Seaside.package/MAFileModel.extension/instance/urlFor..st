*magritte-seaside-accessing
urlFor: aRenderContext 
	self 
		greaseDeprecatedApi: 'MAFileModel>>#urlFor:'
		details: 'Use MAFileModel>>#url.'.
	^ self url