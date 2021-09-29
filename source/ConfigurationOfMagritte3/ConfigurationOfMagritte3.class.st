"
(ConfigurationOfMagritte3 project version: #stable) load
"
Class {
	#name : #ConfigurationOfMagritte3,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfMagritte3'
}

{ #category : #private }
ConfigurationOfMagritte3 class >> bootstrapPackage: aString from: aPath [ 
	| repository version |
	repository := MCHttpRepository
				location: aPath
				user: ''
				password: ''.
	repository
		versionReaderForFileNamed: aString , '.mcz'
		do: [:reader | 
			version := reader version.
			version load.
			version workingCopy repositoryGroup addRepository: repository]
]

{ #category : #private }
ConfigurationOfMagritte3 class >> ensureMetacello [
	"Bootstrap Gofer (if necessary), bootstrap ConfigurationOfMetacello (using old Gofer API), then load the latest 
	version of Metacello itself."

	Smalltalk at: #MetacelloProject ifAbsent: [
		Smalltalk at: #Gofer ifAbsent: [
			"Current version of Gofer from which to bootstrap - as of 1.0-beta.15"
			self bootstrapPackage: 'Gofer-lr.83' from: 'http://seaside.gemstone.com/ss/metacello' ].
		Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer |
			gofer := goferClass new
				url: 'http://seaside.gemstone.com/ss/metacello';
				yourself.
			[ gofer addPackage: 'ConfigurationOfMetacello' ] on: Warning do: [:ex | ex resume ].
			gofer load ].
		"load 'default' group of Metacello"
		(Smalltalk at: #ConfigurationOfMetacello) perform: #load ]
]

{ #category : #'metacello tool support' }
ConfigurationOfMagritte3 class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #'metacello tool support' }
ConfigurationOfMagritte3 class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #loading }
ConfigurationOfMagritte3 class >> load [
	"self load"
	
	self project stableVersion load
]

{ #category : #'metacello tool support' }
ConfigurationOfMagritte3 class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfMagritte3 class >> project [

	^self new project
]

{ #category : #release }
ConfigurationOfMagritte3 class >> releaseToGemSource [
	"self releaseToGemSource"

	(Smalltalk at: #Gofer) new
		gemsource: 'MetacelloRepository';
		package: self name asString;
		push
]

{ #category : #release }
ConfigurationOfMagritte3 class >> releaseToSqueakSource [
	"self releaseToSqueakSource"

	(Smalltalk at: #Gofer) new
		squeaksource: 'MetacelloRepository';
		package: self name asString;
		push
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline300: spec [
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
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline300CommonExtDeps: spec [
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
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline300ForGemStone: spec [
	spec
		for: #gemstone
		do: [ 
			spec
				project: 'GsCore'
				with: [ 
					spec
						className: 'ConfigurationOfGsCore';
						versionString: #bleedingEdge;
						repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ].
			spec
				package: 'Magritte-Model'
					with: [ 
							spec
								requires: #('GsCore');
								includes: #('Magritte-GemStone-Model') ];
				package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-GemStone-Model') ];
				package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-GemStone-Seaside') ];
				package: 'Magritte-GemStone-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-GemStone-Model' with: [ spec requires: #('Magritte-GemStone-Model') ];
				package: 'Magritte-GemStone-Seaside' with: [ spec requires: #('Magritte-Seaside') ] ]
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline300ForPharo: spec [
	spec
		for: #'pharo1.x'
		do: [ 
			spec
				project: 'FileSystem' with: [ 
					spec
						className: 'ConfigurationOfFilesystem';
						versionString: #'stable';
						loads: #( 'default' );
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			spec
				package: 'Magritte-Model' with: [ spec requires: #( 'FileSystem' ) ] ].
	spec
		for: #(#'pharo1.x' #'pharo2.x' #'squeak')
		do: [ 
			spec
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo-Model') ];
				package: 'Magritte-Pharo-Model' with: [ spec requires: #('Magritte-Model') ]].
	spec
		for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x')
		do: [ 
			spec
				package: 'Magritte-Pharo3-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo3-Model') ];
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo3-Model') ];
				" create a temporary alias "
				package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo3-Model'].
	spec
		for: #squeakCommon
		do: [ 
			spec
				package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-Pharo-Model') ];
				package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-Pharo-Seaside') ];				
				package: 'Magritte-Pharo-Seaside' with: [ spec requires: #('Magritte-Seaside') ];
				package: 'Magritte-Morph' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Pharo-Tools' with: [ spec requires: #('Magritte-Deprecated') ].
			spec
				group: 'Tools' with: #('Magritte-Pharo-Tools');
				group: 'Morphic' with: #('Magritte-Morph') ] 
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline310: spec [
	<version: '3.1-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec author: 'DiegoLont'.
			spec timestamp: '2013-07-22'.
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
	self baseline300ForPharo: spec.
	self baseline300ForGemStone: spec
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline310CommonExtDeps: spec [
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
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline330: spec [
	<version: '3.3-baseline'>
	spec
		for: #common
		do: [ 
			spec blessing: #baseline.
			spec author: 'SeanDeNigris'.
			spec timestamp: '2015-04-05'.
			spec description: 'For pharo4.x, add Magritte-GT package and add it to the default group'.
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
	self baseline330ForPharo: spec.
	self baseline300ForGemStone: spec
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline330ForPharo: spec [
	spec
		for: #'pharo1.x'
		do: [ 
			spec
				project: 'FileSystem' with: [ 
					spec
						className: 'ConfigurationOfFilesystem';
						versionString: #'stable';
						loads: #( 'default' );
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			spec
				package: 'Magritte-Model' with: [ spec requires: #( 'FileSystem' ) ] ].
	spec
		for: #(#'pharo1.x' #'pharo2.x' #'squeak')
		do: [ 
			spec
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo-Model') ];
				package: 'Magritte-Pharo-Model' with: [ spec requires: #('Magritte-Model') ]].
	spec
		for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x')
		do: [ 
			spec
				package: 'Magritte-Pharo3-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo3-Model') ];
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo3-Model') ];
				" create a temporary alias "
				package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo3-Model'].
	spec
		for: #(#'pharo4.x')
		do: [ 
			spec
				project: 'MagritteGlamourForPharo40' with: [ 
					spec
						className: 'ConfigurationOfMagritteGlamourForPharo40';
						versionString: #'stable';
						repository: 'http://www.smalltalkhub.com/mc/SeanDeNigris/SeansMetaRepo/main' ].
			spec package: 'Magritte-GT' with: [ spec requires: #('Morphic' 'MagritteGlamourForPharo40') ].
			spec package: 'Magritte-Morph' with: [ spec includes: #('Magritte-GT') ].
			spec group: 'default' with: #('Magritte-GT') ].
	spec
		for: #(#'pharo5.x' #'pharo6.x')
		do: [ 
			spec package: 'Glamour-Magritte-Presentations' with: [ spec repository: 'http://www.smalltalkhub.com/mc/Moose/Glamour/main' ].
			spec package: 'Magritte-GT' with: [ spec requires: #('Morphic' 'Glamour-Magritte-Presentations') ].
			spec group: 'default' with: #('Magritte-GT') ].
	spec
		for: #squeakCommon
		do: [ 
			spec
				package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-Pharo-Model') ];
				package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-Pharo-Seaside') ];				
				package: 'Magritte-Pharo-Seaside' with: [ spec requires: #('Magritte-Seaside') ];
				package: 'Magritte-Morph' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Pharo-Tools' with: [ spec requires: #('Magritte-Deprecated') ].
			spec
				group: 'Tools' with: #('Magritte-Pharo-Tools');
				group: 'Morphic' with: #('Magritte-Morph');
				group: 'default' with: 'Morphic' ] 
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline350: spec [
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

]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline350ForFiles: spec [

	spec
		for: #common
		do: [
			spec
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Files-Model') ];
				package: 'Magritte-Files-Model' with: [ spec requires: #('Magritte-Model') ] ;				
				package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-Files-Model') ];
				package: 'Magritte-Tests-Files-Model' with: [ 
					spec requires: #('Magritte-Tests-Model' 'Magritte-Files-Model' ) ] ].

	spec
		for: #MagritteWithFileSystem
		do: [ 
			spec
				package: 'Magritte-Files-Model' with: [ spec includes: #('Magritte-FileSystem') ];
				package: 'Magritte-FileSystem' with: [ spec requires: #('Magritte-Files-Model') ]].
	spec
		for: #MagritteWithFileDirectory
		do: [ 
			spec
				package: 'Magritte-Files-Model' with: [ spec includes: #('Magritte-FileDirectory') ];
				package: 'Magritte-FileDirectory' with: [ spec requires: #('Magritte-Files-Model') ]].
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline350ForGemStone: spec [
	spec
		for: #gemstone
		do: [ 
			spec
				project: 'GsCore'
				with: [ 
					spec
						className: 'ConfigurationOfGsCore';
						versionString: #bleedingEdge;
						repository: 'http://seaside.gemstone.com/ss/MetacelloRepository' ].
			spec
				package: 'Magritte-Model'
					with: [ 
							spec
								requires: #('GsCore');
								includes: #('Magritte-GemStone-Model') ];
				package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-GemStone-Seaside') ];
				package: 'Magritte-GemStone-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-GemStone-Seaside' with: [ spec requires: #('Magritte-Seaside') ] ]
]

{ #category : #baselines }
ConfigurationOfMagritte3 >> baseline350ForPharo: spec [
	spec
		for: #'pharo1.x'
		do: [ 
			spec
				project: 'FileSystem' with: [ 
					spec
						className: 'ConfigurationOfFilesystem';
						versionString: #'stable';
						loads: #( 'default' );
						repository: 'http://www.squeaksource.com/MetacelloRepository' ].
			spec
				package: 'Magritte-Model' with: [ spec requires: #( 'FileSystem' ) ] ].
	spec
		for: #(#'pharo1.x' #'pharo2.x' #'squeak')
		do: [ 
			spec
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo-Model') ];
				package: 'Magritte-Pharo-Model' with: [ spec requires: #('Magritte-Model') ]].
	spec
		for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x')
		do: [ 
			spec
				package: 'Magritte-Pharo3-Model' with: [ spec requires: #('Magritte-Model'); includes: #('Magritte-FileSystem') ];
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo3-Model') ];
				" create a temporary alias "
				package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo3-Model'].
	spec
		for: #(#'pharo4.x')
		do: [ 
			spec
				project: 'MagritteGlamourForPharo40' with: [ 
					spec
						className: 'ConfigurationOfMagritteGlamourForPharo40';
						versionString: #'stable';
						repository: 'http://www.smalltalkhub.com/mc/SeanDeNigris/SeansMetaRepo/main' ].
			spec package: 'Magritte-GT' with: [ spec requires: #('Morphic' 'MagritteGlamourForPharo40') ].
			spec package: 'Magritte-Morph' with: [ spec includes: #('Magritte-GT') ].
			spec group: 'default' with: #('Magritte-GT') ].
	spec
		for: #(#'pharo5.x' #'pharo6.x')
		do: [ 
			spec package: 'Glamour-Magritte-Presentations' with: [ spec repository: 'http://www.smalltalkhub.com/mc/Moose/Glamour/main' ].
			spec package: 'Magritte-GT' with: [ spec requires: #('Morphic' 'Glamour-Magritte-Presentations') ].
			spec group: 'default' with: #('Magritte-GT') ].
	spec
		for: #squeakCommon
		do: [ 
			spec
				package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-Pharo-Seaside') ];				
				package: 'Magritte-Pharo-Seaside' with: [ spec requires: #('Magritte-Seaside') ];
				package: 'Magritte-Morph' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Pharo-Tools' with: [ spec requires: #('Magritte-Deprecated') ].
			spec
				group: 'Tools' with: #('Magritte-Pharo-Tools');
				group: 'Morphic' with: #('Magritte-Morph');
				group: 'default' with: 'Morphic' ] .
	spec
		for: #MagritteWithTraits
		do: [ 
			spec
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Traits-Model') ];
				package: 'Magritte-Traits-Model' with: [ spec requires: #('Magritte-Model') ]].			
]

{ #category : #accessing }
ConfigurationOfMagritte3 >> customProjectAttributes [

	| projectAttributes versionString |
	projectAttributes := #().
	versionString := ''.
	Smalltalk at: #SystemVersion ifPresent: [:cl |versionString := cl current version].
	
	" Special Pharo1.0 "
	((versionString beginsWith: 'Pharo-1.0') or: [versionString beginsWith: 'PharoCore1.0'])
		ifTrue: [ projectAttributes := projectAttributes, #(#'MagritteForPharo1.0') ].

	" Traits if present "
	((versionString beginsWith: 'Pharo') or: [Smalltalk hasClassNamed: #Trait])
		ifTrue: [ projectAttributes := projectAttributes, #(#'MagritteWithTraits') ].

	" FileSystem if applicable "
	((versionString beginsWith: 'Pharo') or: [Smalltalk hasClassNamed: #FileSystem])
		ifTrue: [ projectAttributes := projectAttributes, #(#'MagritteWithFileSystem') ]
		ifFalse: [ projectAttributes := projectAttributes, #(#'MagritteWithFileDirectory') ].
		
	^ projectAttributes
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '3.5-baseline'
]

{ #category : #accessing }
ConfigurationOfMagritte3 >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		project := (Smalltalk at: #MetacelloMCProject) new.
		project projectAttributes: self customProjectAttributes.
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear ]
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> release30: spec [ 
	<symbolicVersion: #'release3.0'>
	
	spec for: #'common' version: '3.0.4'
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> release31: spec [ 
	<symbolicVersion: #'release3.1'>
	
	spec for: #'common' version: '3.1.4'
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> release32: spec [ 
	<symbolicVersion: #'release3.2'>
	
	spec for: #'common' version: '3.2.0'
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> release33: spec [ 
	<symbolicVersion: #'release3.3'>
	
	spec for: #'common' version: '3.3.2'
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> release34: spec [ 
	<symbolicVersion: #'release3.4'>
	
	spec for: #'common' version: '3.4.2'
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> release35: spec [ 
	<symbolicVersion: #'release3.5'>
	
	spec for: #'common' version: '3.5.2'
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> release3: spec [ 
	<symbolicVersion: #'release3'>
	
	spec for: #'common' version: #'release3.5'.
	" A release should run without errors ... "
	spec for: #'pharo2.x' version: #'release3.2'.
	spec for: #'pharo3.x' version: #'release3.2'.
	spec for: #'pharo4.x' version: #'release3.2'
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritte3 >> stable: spec [ 
	<symbolicVersion: #stable>

	spec for: #'common' version: #'release3'.

]

{ #category : #versions }
ConfigurationOfMagritte3 >> version300: spec [
	<version: '3.0' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		
		spec description: '3.0:
- #description replaced by #magritteDescription (#description deprecated)
- MAPragmaBuilder as default - model is now described using pragmas rather than #descriptionXXX naming convention.
- models are described on the instance side and built dynamically - no need for #magritteDynamicObject
- refactoring support (Magritte-Tools) transforms model descriptions into pragmas and moves descriptions from class to instance-side.
Updated configuration to use Seaside3'.
		spec author: 'NickAger'.
		spec timestamp: '30 January 2012 12:55:56 pm'.
		spec 
			project: 'Grease' with: '1.0.8';
			project: 'Seaside3' with: '3.0.8'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-NickAger.431';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.32';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-NickAger.63';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.27' ].
	spec for: #'pharo3.x' do: [ 
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33'].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version301: spec [
	<version: '3.0.1' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		
		spec description: '3.0:
- #description replaced by #magritteDescription (#description deprecated)
- MAPragmaBuilder as default - model is now described using pragmas rather than #descriptionXXX naming convention.
- models are described on the instance side and built dynamically - no need for #magritteDynamicObject
- refactoring support (Magritte-Tools) transforms model descriptions into pragmas and moves descriptions from class to instance-side.
Updated configuration to use Seaside3'.
		spec author: 'NickAger'.
		spec timestamp: '30 January 2012 12:55:56 pm'.
		spec 
			project: 'Grease' with: '1.0.8';
			project: 'Seaside3' with: '3.0.9'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DamienCassou.432';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.32';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-NickAger.63';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.27' ].
	spec for: #'pharo3.x' do: [ 
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33'].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version302: spec [
	<version: '3.0.2' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'Using #stable version of Grease'.
		spec author: 'EstebanLorenzano'.
		spec timestamp: '8 January 2014 4:43:33 pm'.
		spec 
			project: 'Grease' with: #'stable';
			project: 'Seaside3' with: '3.0.9'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DamienCassou.432';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.32';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-NickAger.63';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.27' ].
	spec for: #'pharo3.x' do: [ 
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33'].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version303: spec [
	<version: '3.0.3' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		
		spec description: '3.0.3:
- updated version 3.0.1:
	More possibilities for labels.'.
		spec author: 'DiegoLont'.
		spec timestamp: '16 January 2014'.
		spec 
			project: 'Grease' with: '1.0.8';
			project: 'Seaside3' with: '3.0.10'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.448';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.32';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-NickAger.63';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33' ].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version304: spec [
	<version: '3.0.4' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		
		spec description: '3.0.4:
- updated version 3.0.3: use releases instead of fixed versions.'.
		spec author: 'DiegoLont'.
		spec timestamp: '16 January 2014'.
		spec 
			project: 'Grease' with: #'release1.0';
			project: 'Seaside3' with: #'release3.0'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.449';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.38';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-NickAger.63';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33' ].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version310: spec [
	<version: '3.1' imports: #('3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		
		spec description: 'initial enhancement of Morphic implementation to bring on par with the Seaside one.
			Updated configuration to use Seaside3.
			Updated configuration to use Grease 1.1.5'.
		spec author: 'DiegoLont'.
		spec timestamp: '22 July 2013 8:13 am'.
		
		spec
			project: 'Grease' with: '1.1.5';
			project: 'Seaside3' with: '3.1.0'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.448';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.29';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-DiegoLont.356';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-TudorGirba.70';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.37' ].
	spec for: #(#'pharo1.x' #'pharo2.x') do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39'].
	spec for: #'pharo3.x' do: [
		spec
			package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-StephanEggermont.1'].	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version3111: spec [
	<version: '3.1.1.1' imports: #('3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		
		spec description: 'MAke Magritte_morph work on Pharo 3'.
		spec author: 'Stephan Eggermont'.
		spec timestamp: '14 May 2014'.
		
		spec
			project: 'Grease' with: #'stable';
			project: 'Seaside3' with: '3.1.0'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.448';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.29';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-DiegoLont.356';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-TudorGirba.70';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.37' ].
	spec for: #(#'pharo1.x' #'pharo2.x') do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39'].
	spec for: #'pharo3.x' do: [
		spec
			package: 'Magritte-Morph' with: 'Magritte-Morph-TudorGirba.79';
			package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-StephanEggermont.1'].	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version311: spec [
	<version: '3.1.1' imports: #('3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		
		spec description: 'switched grease to #stable. Although it is not a good idea we need to find a solution so that only
		one version of a package is loaded'.
		spec author: 'NorbertHartl'.
		spec timestamp: '21 March 2014'.
		
		spec
			project: 'Grease' with: #'stable';
			project: 'Seaside3' with: '3.1.0'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.448';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.29';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-DiegoLont.356';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-TudorGirba.70';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.37' ].
	spec for: #(#'pharo1.x' #'pharo2.x') do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39'].
	spec for: #'pharo3.x' do: [
		spec
			package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-StephanEggermont.1'].	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version312: spec [
	<version: '3.1.2' imports: #('3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		
		spec description: 'switched to release based management'.
		spec author: 'StephanEggermont'.
		spec timestamp: '7 April 2014'.
		
		spec
			project: 'Grease' with: #'release1.1';
			project: 'Seaside3' with: #'release3.1'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.448';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.29';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-DiegoLont.356';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-TudorGirba.70';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.37' ].
	spec for: #(#'pharo1.x' #'pharo2.x') do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39'].
	spec for: #'pharo3.x' do: [
		spec
			package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-StephanEggermont.1'].	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version313: spec [
	<version: '3.1.3' imports: #('3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		
		spec description: 'Updated with latest packages'.
		spec author: 'StephanEggermont'.
		spec timestamp: '7 April 2014'.
		
		spec
			project: 'Grease' with: #'release1.1';
			project: 'Seaside3' with: #'release3.1'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.450';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.38';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-DiegoLont.356';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-TudorGirba.70';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #(#'pharo1.x' #'pharo2.x') do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39'].
	spec for: #(#'pharo3.x' #'pharo4.x') do: [
		spec
			package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-DamienCassou.2'].	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version314: spec [
	<version: '3.1.4' imports: #('3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'release'.
		
		spec description: 'New version opened for development'.
		spec author: 'Diego Lont'.
		spec timestamp: '21 May 2014'.
		
		spec
			project: 'Grease' with: #'release1.1';
			project: 'Seaside3' with: #'release3.1'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.450';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.38';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-DiegoLont.357';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.86';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #(#'pharo1.x' #'pharo2.x') do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39'].
	spec for: #(#'pharo3.x' #'pharo4.x') do: [
		spec
			package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-DamienCassou.2'].	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version315: spec [
	<version: '3.1.5' imports: #('3.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		
		spec description: 'Updated for recent changes. Not yet published as stable'.
		spec author: 'Esteban Maringolo'.
		spec timestamp: '2 November 2014'.
		
		spec
			project: 'Grease' with: #'release1.1';
			project: 'Seaside3' with: #'release3.1'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-EstebanMaringolo.452';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.38';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-EstebanMaringolo.359';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.86';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #(#'pharo1.x' #'pharo2.x') do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39'].
	spec for: #(#'pharo3.x' #'pharo4.x') do: [
		spec
			package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-DiegoLont.3'].	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version320: spec [
  <version: '3.2.0' imports: #('3.1-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec description: 'New version opened for development'.
      spec author: 'dkh'.
      spec timestamp: '2/26/2015 13:51'.
      spec
        project: 'Grease' with: #'release1.1';
        project: 'Seaside3' with: #'release3.1'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-EstebanMaringolo.452';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-DiegoLont.38';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-StephanEggermont.358';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Tests-Pharo-Model'
          with: 'Magritte-Tests-Pharo-Model-lr.4';
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.86';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
  spec
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x')
    do: [ spec package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-DiegoLont.3' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-dkh.4';
        package: 'Magritte-Tests-GemStone-Model'
          with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version330: spec [
  <version: '3.3.0' imports: #('3.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec description: 'For pharo4.x, add Magritte-GT package and add it to the default group'.
      spec author: 'spd'.
      spec timestamp: '04/05/2015 13:51'.
      spec
        project: 'Grease' with: #'release1.1';
        project: 'Seaside3' with: #'release3.1'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-EstebanMaringolo.452';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-DiegoLont.38';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-StephanEggermont.358';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Tests-Pharo-Model'
          with: 'Magritte-Tests-Pharo-Model-lr.4';
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.86';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
  spec
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x')
    do: [ spec package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-DiegoLont.3' ].
  spec
    for: #'pharo4.x'
    do: [ spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.1' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-dkh.4';
        package: 'Magritte-Tests-GemStone-Model'
          with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version331: spec [
  <version: '3.3.1' imports: #('3.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec description: 'configuration in order to avoid deprecated methods'.
      spec author: 'CyrilFerlicot'.
      spec timestamp: '05/06/2015 10:51'.
      spec
        project: 'Grease' with: #'release1.1';
        project: 'Seaside3' with: #'release3.1'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-StephanEggermont.458';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-DiegoLont.38';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-EstebanMaringolo.359';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Tests-Pharo-Model'
          with: 'Magritte-Tests-Pharo-Model-lr.4';
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.86';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
  spec
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x')
    do: [ spec package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-JohnCBorden.4' ].
  spec
    for: #'pharo4.x'
    do: [ spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.1' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-dkh.4';
        package: 'Magritte-Tests-GemStone-Model'
          with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version332: spec [
  <version: '3.3.2' imports: #('3.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec description: 'In-place fix add: pharo 5, StephanEggermont 2015-7-12
 configuration in order to avoid deprecated methods'.
      spec author: 'CyrilFerlicot'.
      spec timestamp: '05/06/2015 10:51'.
      spec
        project: 'Grease' with: #'release1.1';
        project: 'Seaside3' with: #'release3.1'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-StephanEggermont.458';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-DiegoLont.38';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-EstebanMaringolo.359';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Tests-Pharo-Model'
          with: 'Magritte-Tests-Pharo-Model-lr.4';
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.86';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
  spec
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x')
    do: [ spec package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-JohnCBorden.4' ].
  spec
    for: #(#'pharo4.x' #'pharo5.x')
    do: [ spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.3' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-dkh.4';
        package: 'Magritte-Tests-GemStone-Model'
          with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version342: spec [
  <version: '3.4.2' imports: #('3.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'release'.
      spec description: '- [ENH]: Add URL description
- [BUG]: For Dates, instead of printing "nil", leave blank'.
      spec author: 'SeanDeNigris'.
      spec timestamp: '08/06/2015 10:51'.
      spec
        project: 'Grease' with: #'release1.1';
        project: 'Seaside3' with: #'release3.1'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-SeanDeNigris.462';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-DiegoLont.38';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-EstebanMaringolo.359';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Tests-Pharo-Model'
          with: 'Magritte-Tests-Pharo-Model-lr.4';
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.86';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
  spec
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x')
    do: [ spec package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-JohnCBorden.4' ].
  spec
    for: #(#'pharo4.x' #'pharo5.x')
    do: [ spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.3' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-dkh.4';
        package: 'Magritte-Tests-GemStone-Model'
          with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version350: spec [
  <version: '3.5.0' imports: #('3.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec description: '-[Feature]: Meta-describe GT presentations https://github.com/magritte-metamodel/magritte/issues/26
- [ENH]: Provide hook to initialize ToMany Instances https://github.com/magritte-metamodel/magritte/issues/18
- [ENH]: Actions; fill out a few dark corners
- [BUG]: Hack to make ToOne Morphs work i.e. stop infinite recursion, by duplicating ToMany logic (for now). https://github.com/magritte-metamodel/magritte/issues/25
- [Bug]: MAMemoMorph - respect #readonly of description by disabling editing ability
- [Bug]: In MAElementMorph>>string:, do not silently swallow read errors
- [BUG]: MADateMorph - when building, set value before display block; unfortunately, I don''t remember why that was important, but I ran into a problem the other way.
- [Clean]: Import action button construction, which had been mistakenly put in Model package
- [BUG]: Hack to make ToOne Morphs work i.e. stop infinite recursion, by duplicating ToMany logic (for now). https://github.com/magritte-metamodel/magritte/issues/25'.
      spec author: 'SeanDeNigris'.
      spec timestamp: '08/20/2015 10:51'.
      spec
        project: 'Grease' with: #'release1.2';
        project: 'Seaside3' with: #'release3.1'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-SeanDeNigris.465';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-DiegoLont.38';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-EstebanMaringolo.359';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Tests-Pharo-Model'
          with: 'Magritte-Tests-Pharo-Model-lr.4';
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.95';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
  spec
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x')
    do: [ spec package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-JohnCBorden.4' ].
  spec
    for: #(#'pharo4.x')
    do: [ 
			spec
        project: 'MagritteGlamourForPharo40' with: '1.0'.
			spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.5' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-dkh.4';
        package: 'Magritte-Tests-GemStone-Model'
          with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version351: spec [
  <version: '3.5.1' imports: #('3.3-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec description: ''.
      spec author: 'TudorGirba'.
      spec timestamp: '08/10/2016 20:51'.
      spec
        project: 'Grease' with: #'release1.2';
        project: 'Seaside3' with: #'release3.2'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-TudorGirba.468';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-SeanDeNigris.39';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-EstebanMaringolo.359';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Tests-Pharo-Model'
          with: 'Magritte-Tests-Pharo-Model-lr.4';
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.99';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #'squeak'
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
  spec
    for: #(#'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x')
    do: [ spec package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-JohnCBorden.4' ].
  spec
    for: #(#'pharo4.x')
    do: [ 
			spec
        project: 'MagritteGlamourForPharo40' with: '1.0'.
			spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.5' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-dkh.4';
        package: 'Magritte-Tests-GemStone-Model'
          with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]
]

{ #category : #versions }
ConfigurationOfMagritte3 >> version352: spec [
  <version: '3.5.2' imports: #('3.5-baseline')>
  spec
    for: #'common'
    do: [ 
      spec blessing: #'development'.
      spec author: 'topa'.
      spec timestamp: '17/11/2017 23:38'.
      spec description: 'Split out Trait extensions FileSystem/Directory detection and load only when supported.
- Traits are supporten in Pharo and Squek (but only when loaded).
- FileSystem is in all newer Pharo but could be loaded in Pharo 1.0 and Squeak, GemStone and Squeak have FileDriectory by default'.
      spec
        project: 'Grease' with: #'release1.2';
        project: 'Seaside3' with: #'release3.2'.
      spec
        package: 'Magritte-Model' with: 'Magritte-Model-topa.474';
        package: 'Magritte-Tests-Model'
          with: 'Magritte-Tests-Model-topa.41';
        package: 'Magritte-Seaside'
          with: 'Magritte-Seaside-DiegoLont.360';
        package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7';
        package: 'Magritte-Files-Model' with: 'Magritte-Files-Model-topa.1'; 
        package: 'Magritte-Tests-Files-Model' with: 'Magritte-Tests-Files-Model-topa.1';
        package: 'Magritte-FileDirectory' with: 'Magritte-FileDirectory-topa.1'; 
        package: 'Magritte-FileSystem' with: 'Magritte-FileSystem-topa.2';
        yourself ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec
        package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
        package: 'Magritte-Morph' with: 'Magritte-Morph-SeanDeNigris.99';
        package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
  spec
    for: #(#'squeak' #'pharo1.x' #'pharo2.x')
    do: [ spec package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-topa.40' ].
  spec
    for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x' #'pharo7.x')
    do: [
	spec
		package: 'Magritte-FileSystem' with: 'Magritte-FileSystem-topa.1'; "Do not change. is empty"
		package: 'Magritte-Pharo3-Model' with: 'Magritte-Pharo3-Model-JohnCBorden.4' ].
  spec
    for: #(#'pharo4.x')
    do: [ 
			spec
        project: 'MagritteGlamourForPharo40' with: '1.0'.
			spec package: 'Magritte-GT' with: 'Magritte-GT-SeanDeNigris.5' ].
  spec
    for: #'MagritteWithTraits'
    do: [ spec package: 'Magritte-Traits-Model' with: 'Magritte-Traits-Model-topa.2' ].
  spec
    for: #'gemstone'
    do: [ 
      spec project: 'GsCore' with: '0.242'.
      spec
        package: 'Magritte-GemStone-Model'
          with: 'Magritte-GemStone-Model-topa.5';
        package: 'Magritte-GemStone-Seaside'
          with: 'Magritte-GemStone-Seaside-DaleHenrichs.2' ]
]
