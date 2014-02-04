accessing-dynamic
directory

	^ directory ifNil: [ directory := self database uniqueLocation ].