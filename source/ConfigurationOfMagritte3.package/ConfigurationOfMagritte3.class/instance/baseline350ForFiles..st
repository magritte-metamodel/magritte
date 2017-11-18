baselines
baseline350ForFiles: spec

	spec
		for: #common
		do: [
			spec
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Files-Model') ];
				package: 'Magritte-Files-Model' with: [ spec requires: #('Magritte-Model') ] ;				
				package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-Files-Model') ];
				package: 'Magritte-Tests-Files-Model' with: [ 
					spec requires: #('Magritte-Tests-Model' 'Magritte-Files-Model' ) ] ].

	spec
		for: #MagritteWithFileSystem
		do: [ 
			spec
				package: 'Magritte-Files-Model' with: [ spec includes: #('Magritte-FileSystem') ];
				package: 'Magritte-FileSystem' with: [ spec requires: #('Magritte-Files-Model') ]].
	spec
		for: #MagritteWithFileDirectory
		do: [ 
			spec
				package: 'Magritte-Files-Model' with: [ spec includes: #('Magritte-FileDirectory') ];
				package: 'Magritte-FileDirectory' with: [ spec requires: #('Magritte-Files-Model') ]].