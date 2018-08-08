*magritte-morph
buttonOn: anObject

	model := anObject.
	^ UITheme current builder newButtonFor: self action: #perform getEnabled: #isEnabled label: self label help: comment.