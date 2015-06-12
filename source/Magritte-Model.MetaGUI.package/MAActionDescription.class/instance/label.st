accessing
label

	^ label ifNil: [ selector capitalized normalizeCamelCase ].