accessing
magritteDescriptionPragma
	^ magritteDescriptionPragma ifNil: [ magritteDescriptionPragma := self class magritteDescriptionPragma ]