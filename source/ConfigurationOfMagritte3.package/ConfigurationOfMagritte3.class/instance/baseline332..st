baselines
baseline332: spec
	<version: '3.3.2-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
      spec description: 'For Pharo 4.0, load GT presentations by default
- This requires loading Morphic, so I thought a new baseline/version was appropriate.
- Bump -GT package to latest version'.
      spec author: 'SeanDeNigris'.
      spec timestamp: '06/03/2015 10:51'.
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
	self baseline332ForPharo: spec.
	self baseline300ForGemStone: spec