accessing
selected
	^ selected ifNil: [ selected := self classes first ]