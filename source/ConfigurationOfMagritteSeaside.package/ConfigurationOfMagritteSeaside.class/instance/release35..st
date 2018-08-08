version
release35: spec 
	<version: 'release3.5'>
	
	spec 
		for: #'common'
		do: [ 
			spec
				project: 'Magritte3' with: [ 
					spec
						className: 'ConfigurationOfMagritte3';
						versionString: #'release3.5';
						loads: #( 'Seaside' );
						repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main/' ] ]