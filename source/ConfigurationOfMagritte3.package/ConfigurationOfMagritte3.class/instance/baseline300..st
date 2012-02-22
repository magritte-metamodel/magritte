baselines
baseline300: spec
	<version: '3.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec author: 'NickAger'.
		spec timestamp: '01/30/2011 11:02:07'.
		spec repository: 'http://source.lukas-renggli.ch/magritte3'.
		spec 
			project: 'Grease' with: [
				spec
					className: 'ConfigurationOfGrease';
					versionString: #'stable';
					loads: #('Core' );
					repository: 'http://www.squeaksource.com/MetacelloRepository' ];
			project: 'Seaside30' with: [
				spec
					className: 'ConfigurationOfSeaside30';
					versionString: #'stable';
					loads: #('Core');
					repository: 'http://www.squeaksource.com/MetacelloRepository' ].
		spec 
			package: 'Magritte-Model' with: [
				spec requires: #('Grease' ) ];
			package: 'Magritte-Tests-Model' with: [
				spec requires: #('Magritte-Model' ) ];
			package: 'Magritte-Seaside' with: [
				spec requires: #('Magritte-Model' 'Seaside30' ) ];
			package: 'Magritte-Deprecated' with: [
				spec requires: #('Magritte-Model' 'Magritte-Morph') ].
		spec 
			group: 'default' with: #('Core' );
			group: 'Core' with: #('Magritte-Model' );
			group: 'Tests' with: #('Magritte-Tests-Model' );
			group: 'Seaside' with: #('Magritte-Seaside');
			group: 'Deprecated' with: #('Magritte-Deprecated') ].

	spec for: #'pharo' do: [
		spec 
			package: 'Magritte-Model' with: [
				spec includes: #('Magritte-Pharo-Model' ). ];
			package: 'Magritte-Tests-Model' with: [
				spec includes: #('Magritte-Tests-Pharo-Model' ). ];
			package: 'Magritte-Seaside' with: [
				spec includes: #('Magritte-Pharo-Seaside' ). ];
			package: 'Magritte-Pharo-Model' with: [
				spec requires: #('Magritte-Model' 'Magritte-Morph' ). ];
			package: 'Magritte-Tests-Pharo-Model' with: [
				spec requires: #('Magritte-Pharo-Model' ). ];
			package: 'Magritte-Pharo-Seaside' with: [
				spec requires: #('Magritte-Seaside' ). ];
			package: 'Magritte-Morph' with: [
				spec requires: #('Magritte-Model' ). ];
			package: 'Magritte-Pharo-Tools' with: [
				spec requires: #('Magritte-Deprecated' ). ].
		spec
			group: 'Tools' with: #('Magritte-Pharo-Tools') ].
		
	spec for: #gemstone do: [
		spec project: 'GsCore' with: [
			spec
				className: 'ConfigurationOfGsCore';
				versionString: #'bleedingEdge';
				repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ].		
		spec 
			package: 'Magritte-Model' with: [
				spec 
					requires: #('GsCore' );
					includes: #('Magritte-GemStone-Model' ). ];
			package: 'Magritte-Tests-Model' with: [
				spec includes: #('Magritte-Tests-GemStone-Model' ). ];
			package: 'Magritte-Seaside' with: [
				spec includes: #('Magritte-GemStone-Seaside' ). ];
			package: 'Magritte-GemStone-Model' with: [
				spec requires: #('Magritte-Model' ). ];
			package: 'Magritte-Tests-GemStone-Model' with: [
				spec requires: #('Magritte-GemStone-Model' ). ];
			package: 'Magritte-GemStone-Seaside' with: [
				spec requires: #('Magritte-Seaside' ) ] ]