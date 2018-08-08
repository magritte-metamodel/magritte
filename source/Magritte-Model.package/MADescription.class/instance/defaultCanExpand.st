*magritte-model-builder
defaultCanExpand
	" used to expand a relation description into a group "
	self isVisible ifFalse: [ ^false ].
	self isReadonly ifTrue: [ ^false ].
	self tabDisplay ifTrue: [ ^false ].
	self group ifNotNil: [ ^false ].
	^true