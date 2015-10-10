baselines
baseline10: spec
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'First Full Configuration'.
		spec author: 'StephaneDucasse'.
		spec timestamp: '8/10/2015'.
		spec repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main'.
		
		spec project: 'MagritteSeaside'
			with: [ 
					spec
						className: 'ConfigurationOfMagritteSeaside';
						versionString: #stable;
						repository: 'http://smalltalkhub.com/Magritte/Magritte3/main'.].
		spec
				package: 'Magritte-ContactManager' with: [ spec requires: 'MagritteSeaside' ]]
		
	
