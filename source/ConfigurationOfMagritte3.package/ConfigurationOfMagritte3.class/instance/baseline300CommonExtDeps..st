baselines
baseline300CommonExtDeps: spec
	"Common external dependencies for baseline 3.0.0"
	spec
		project: 'Grease'
			with: [ 
					spec
						className: 'ConfigurationOfGrease';
						versionString: #stable;
						loads: #('Core');
						repository: 'http://www.squeaksource.com/MetacelloRepository' ];
		project: 'Seaside30'
			with: [ 
					spec
						className: 'ConfigurationOfSeaside30';
						versionString: #stable;
						loads: #('Base' 'Development' 'RSS-Core' 'Javascript-Core' 'Prototype-Core' 'Scriptaculous-Core' 'JQuery-Core' 'JQuery-UI' 'Seaside-Email' 'Seaside-HTML5' 'Seaside-InternetExplorer' 'Seaside-Examples' 'RSS-Examples' 'Seaside-Tools-Web' 'Scriptaculous-Components' 'Seaside-Welcome' 'Seaside-FileSystem' );
						repository: 'http://www.squeaksource.com/MetacelloRepository' ]