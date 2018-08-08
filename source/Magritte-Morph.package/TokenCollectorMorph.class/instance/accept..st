private
accept: text
	| object |
	object := self options
		detect: [ :e | self stringDecoder value: e value: text ]
		ifNone: [ factory value: text ].
	self objects add: object.
	whenObjectsChangedBlock ifNotNil: [ :blk | blk value: self objects ].
	self refresh