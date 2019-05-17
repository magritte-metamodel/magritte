accessing
label

	^ label ifNil: [ action asString capitalized normalizeCamelCase ].