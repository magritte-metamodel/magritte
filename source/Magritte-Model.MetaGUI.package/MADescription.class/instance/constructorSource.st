development support
constructorSource
	| customDescriptions |
	customDescriptions := self magritteDescription children select: [ :e | (e accessor read: self) ~= e default and: [ e accessor writeSelector ~= #name: ] ].

	^ String streamContents: [ :str |
		str
			"nextPutAll: d accessor readSelector;
			cr;
			tab;"
			nextPutAll: '^ ';
			nextPutAll: self className;
			nextPutAll: ' new';
			cr.
		customDescriptions
			do: [ :e |
				str
					tab; tab;
					nextPutAll: e accessor writeSelector;
					space;
					print: (e accessor read: self);
					nextPut: $;;
					cr ].
		str tab; tab; nextPutAll: 'yourself' ].