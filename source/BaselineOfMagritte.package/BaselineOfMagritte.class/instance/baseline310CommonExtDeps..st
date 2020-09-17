baselines
baseline310CommonExtDeps: spec
	"Common external dependencies for baseline 3.1.0"

	spec
		baseline: 'Grease' with: [ spec repository: 'github://SeasideSt/Grease:v1.6.x/repository' ];
		baseline: 'Seaside3'
			with: [ "note: we do not want to depend on Zinc, since this is not present in Squeak. Currently no adapter is loaded"
			spec
				repository: 'github://SeasideSt/Seaside:master/repository';
				loads: #('Core') ]
