printing
storeOn: aStream
	aStream 
		nextPutAll: self className;
		nextPutAll: ' new'; cr.
	(self magritteDescription reject: #isReadOnly) do: [ :desc |
		| value |
		value := desc read: self.
		(value ~= desc default and: [ value isNotNil ]) ifTrue: [ 
			desc accessor store: value inDescriptionOn: aStream ] ].
	aStream nextPutAll: 'yourself'