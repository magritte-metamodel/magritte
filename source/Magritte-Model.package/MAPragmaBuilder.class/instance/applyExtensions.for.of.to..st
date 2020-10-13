private
applyExtensions: descriptionExtensions for: each of: anObject to: description
	description ifNil: [ ^ nil ].
	^ (self extensionsFrom: descriptionExtensions matching: description) 
		ifEmpty: [ description ]
		ifNotEmpty: [ :extensions |
			 extensions
				inject: description 
				into: [ :desc :extensionSelector | anObject perform: extensionSelector with: description ] ].