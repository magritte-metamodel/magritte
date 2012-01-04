instance creation
memento: aMemento description: aDescription parent: aComponent
	^ self new
		setMemento: aMemento;
		setDescription: aDescription;
		setParent: aComponent;
		yourself