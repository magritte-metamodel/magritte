accessing
filename: aString
	"Normalize the filenames. Don't just allow any stupid windows filename.'"

	filename := aString isNil ifFalse: [ 
		aString collect: [ :char |
			(self class validCharacters includes: char)
				ifTrue: [ char ]
				ifFalse: [ 
					char = Character space
						ifTrue: [ $- ]
						ifFalse: [ $_ ] ] ] ]