baselines
baseline300CommonExtDeps: spec
	"Common external dependencies for baseline 3.0.0"
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
					spec
						className: 'ConfigurationOfSeaside3';
						versionString: '3.0.9';
						loads: #('Base' 'Development' 'RSS-Core' 'Javascript-Core' 'Prototype-Core' 'Scriptaculous-Core' 'JQuery-Core' 'JQuery-UI' 'Seaside-Email' 'Seaside-HTML5' 'Seaside-InternetExplorer' 'Seaside-Examples' 'RSS-Examples' 'Seaside-Tools-Web' 'Scriptaculous-Components' 'Seaside-Welcome' 'Seaside-FileSystem' );
						repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main' ]