rendering
renderCellContent: anObject on: html
	| value |
	value := self valueFor: anObject.
	html anchor
		callback: [ anObject write: value not using: self description ];
		with: (self description toString: value)