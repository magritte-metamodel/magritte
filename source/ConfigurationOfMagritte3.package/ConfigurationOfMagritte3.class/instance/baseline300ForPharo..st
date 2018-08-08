baselines
baseline300ForPharo: spec
	spec
		for: #'pharo1.x'
		do: [ 
			spec
				project: 'FileSystem' with: [ 
					spec
						className: 'ConfigurationOfFilesystem';
						versionString: #'stable';
						loads: #( 'default' );
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			spec
				package: 'Magritte-Model' with: [ spec requires: #( 'FileSystem' ) ] ].
	spec
		for: #(#'pharo1.x' #'pharo2.x' #'squeak')
		do: [ 
			spec
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo-Model') ];
				package: 'Magritte-Pharo-Model' with: [ spec requires: #('Magritte-Model') ]].
	spec
		for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x')
		do: [ 
			spec
				package: 'Magritte-Pharo3-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo3-Model') ];
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo3-Model') ];
				" create a temporary alias "
				package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo3-Model'].
	spec
		for: #squeakCommon
		do: [ 
			spec
				package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-Pharo-Model') ];
				package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-Pharo-Seaside') ];				
				package: 'Magritte-Pharo-Seaside' with: [ spec requires: #('Magritte-Seaside') ];
				package: 'Magritte-Morph' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Pharo-Tools' with: [ spec requires: #('Magritte-Deprecated') ].
			spec
				group: 'Tools' with: #('Magritte-Pharo-Tools');
				group: 'Morphic' with: #('Magritte-Morph') ] 