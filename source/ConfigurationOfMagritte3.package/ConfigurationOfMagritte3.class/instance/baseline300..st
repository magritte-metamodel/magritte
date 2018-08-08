baselines
baseline300: spec
	<version: '3.0-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec author: 'DiegoLont'.
			spec timestamp: '2013-07-22'.
			spec repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main'.
			self baseline300CommonExtDeps: spec.
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
	self baseline300ForPharo: spec.
	self baseline300ForGemStone: spec