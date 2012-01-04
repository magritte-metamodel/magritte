private
exampleInstance
	^ MACachedMemento new
		setDescription: self description;
		setCache: (Dictionary new
			at: self child1 put: nil;
			at: self child2 put: nil;
			at: self child3 put: nil;
			yourself);
		yourself