mime types
mimeTypesForExtension: aString 

	| types |
	types := MIMEType forExtensionReturnMimeTypesOrNil: aString.
	^ types ifNotNil: [ types collect: [ :e | e asString ] ].