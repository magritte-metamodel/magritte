accessing
objectDescription
	^ objectDescription ifNil: [ objectDescription := self object magritteDescription ]