private-building
entryCompletion

	entryCompletion ifNotNil: [ ^ entryCompletion ].
	^ entryCompletion := EntryCompletion new
			dataSourceBlock: [ :currText | self options collect: self stringEncoder ];
			filterBlock: [ :currApplicant :currText | currApplicant asString asUppercase includesSubstring: currText asString asUppercase ];
			yourself.