*Magritte-GToolkit
magritteGToolkitActions
	^ self magritteActions children collect: [ :desc | desc gtActionFor: self ].