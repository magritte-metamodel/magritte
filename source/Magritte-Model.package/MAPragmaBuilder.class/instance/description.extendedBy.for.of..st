private
description: description extendedBy: descriptionExtensions for: descriptionSelector of: anObject
	description ifNil: [ ^ nil ].
	^ (self extensionsFrom: descriptionExtensions matching: descriptionSelector) 
		ifEmpty: [ description ]
		ifNotEmpty: [ :extensions |
			 extensions
				inject: description 
				into: [ :desc :extensionSelector | anObject perform: extensionSelector with: description ] ].