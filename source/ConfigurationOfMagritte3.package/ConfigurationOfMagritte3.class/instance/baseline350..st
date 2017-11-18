baselines
baseline350: spec
	<version: '3.5-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec author: 'topa'.
			spec timestamp: '2017-11-17'.
			spec description: 'Split out Trait extensions FileSystem/Directory detection and load only when supported.
- Traits are supporten in Pharo and Squek (but only when loaded).
- FileSystem is in all newer Pharo but could be loaded in Pharo 1.0 and Squeak, GemStone and Squeak have FileDriectory by default'.
			spec repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main'.
			self baseline310CommonExtDeps: spec.
			spec
				package: 'Magritte-Model' with: [ spec requires: #('Grease') ];
				package: 'Magritte-Tests-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Seaside' with: [ spec requires: #('Magritte-Model' 'Seaside3') ];
				package: 'Magritte-Deprecated' with: [ spec requires: #('Magritte-Model') ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('Magritte-Model');
				group: 'Tests' with: #('Magritte-Tests-Model');
				group: 'Seaside' with: #('Magritte-Seaside');
				group: 'Deprecated' with: #('Magritte-Deprecated') ].
	self baseline350ForFiles: spec.
	self baseline350ForPharo: spec.
	self baseline350ForGemStone: spec.
