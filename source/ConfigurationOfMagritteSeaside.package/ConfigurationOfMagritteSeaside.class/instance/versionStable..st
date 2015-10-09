version
versionStable: spec 
	<version: #stable>
	
	spec
		for: #'pharo'
		do: [ 
			spec
				project: 'Magritte3' with: [ 
					spec
						className: 'ConfigurationOfMagritte3';
						versionString: #'release3.5';
						loads: #( 'Seaside' );
						repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main' ].
			]