actions
choose
	| name stream |
	name := UIManager default
		chooseFileMatching: nil 
		label: 'Choose ' , self magritteDescription label.
	stream := FileStream readOnlyFileNamed: name.
	stream isNil ifTrue: [ ^ self ].
	stream binary.
	self value: (self magritteDescription kind new
		contents: stream contents;
		filename: stream localName;
		yourself).
	stream close