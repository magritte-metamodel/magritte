private
buildButton: aSymbol 
	^ UITheme current builder newButtonFor: self action: aSymbol label: aSymbol capitalized help: ''.