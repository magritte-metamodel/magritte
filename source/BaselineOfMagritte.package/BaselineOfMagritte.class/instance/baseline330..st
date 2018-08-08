baselines
baseline330: spec
	<baseline>
	spec
		for: #common
		do: [ 
			spec author: 'SeanDeNigris'.
			spec timestamp: '2015-04-05'.
			spec description: 'For pharo4.x, add Magritte-GT package and add it to the default group'.
			self baseline310CommonExtDeps: spec.
			spec
				package: 'Magritte-Model' with: [ spec requires: #('Grease') ];
				package: 'Magritte-Tests-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Seaside' with: [ spec requires: #('Magritte-Model' 'Seaside3') ];
				package: 'Magritte-Bootstrap' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Deprecated' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Merging' with: [ spec requires: #('Magritte-Model') ].
			spec
				group: 'Core' with: #('Magritte-Model');
				group: 'Tests' with: #('Magritte-Tests-Model');
				group: 'Seaside' with: #('Magritte-Seaside');
				group: 'Deprecated' with: #('Magritte-Deprecated') ].
	self baseline330ForPharo: spec.
	self baseline300ForGemStone: spec