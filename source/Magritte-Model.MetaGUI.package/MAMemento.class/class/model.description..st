instance creation
model: aModel description: aDescription
	^ self new
		setModel: aModel;
		setDescription: aDescription;
		reset; yourself