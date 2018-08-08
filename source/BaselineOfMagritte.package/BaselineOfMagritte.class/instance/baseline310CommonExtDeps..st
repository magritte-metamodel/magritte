baselines
baseline310CommonExtDeps: spec
	"Common external dependencies for baseline 3.1.0"
	spec
		project: 'Grease'
			with: [ 
					spec
						className: 'ConfigurationOfGrease';
						versionString: #'stable';
						loads: #('Core' );
						repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ];
		project: 'Seaside3'
			with: [
				"note: we do not want to depend on Zinc, since this is not present in Squeak. Currently no adapter is loaded" 
					spec
						className: 'ConfigurationOfSeaside3';
						versionString: #'stable';
						loads: #('Core' 'Javascript' 'RSS' 'Filesystem' 'Welcome' );
						repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ]