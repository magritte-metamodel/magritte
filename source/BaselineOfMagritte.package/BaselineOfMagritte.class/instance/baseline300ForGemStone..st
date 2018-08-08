baselines
baseline300ForGemStone: spec
	spec
		for: #gemstone
		do: [ 
			spec
				project: 'GsCore'
				with: [ 
					spec
						className: 'ConfigurationOfGsCore';
						versionString: #bleedingEdge;
						repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ].
			spec
				package: 'Magritte-Model'
					with: [ 
							spec
								requires: #('GsCore');
								includes: #('Magritte-GemStone-Model') ];
				package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-GemStone-Model') ];
				package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-GemStone-Seaside') ];
				package: 'Magritte-GemStone-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-GemStone-Model' with: [ spec requires: #('Magritte-GemStone-Model') ];
				package: 'Magritte-GemStone-Seaside' with: [ spec requires: #('Magritte-Seaside') ] ]