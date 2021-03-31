Class {
	#name : #BaselineOfMagritte,
	#superclass : #BaselineOf,
	#category : #BaselineOfMagritte
}

{ #category : #baselines }
BaselineOfMagritte >> baseline300ForGemStone: spec [
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
BaselineOfMagritte >> baseline310CommonExtDeps: spec [
	"Common external dependencies for baseline 3.1.0"
	
	spec
		baseline: 'Grease' with: [ spec repository: 'github://SeasideSt/Grease:v1.7.x/repository' ];
		baseline: 'Seaside3'
			with: [ "note: we do not want to depend on Zinc, since this is not present in Squeak. Currently no adapter is loaded"
			spec
				repository: 'github://SeasideSt/Seaside:master/repository';
				loads: #('Core') ]

]

{ #category : #baselines }
BaselineOfMagritte >> baseline330ForPharo: spec [
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
		for: #(#'pharo3.x' #'pharo4.x' #'pharo5.x' #'pharo6.x')
		do: [ 
			spec
				package: 'Magritte-Pharo3-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo3-Model') ];
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo3-Model') ];
				" create a temporary alias "
				package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo3-Model'].
	spec
		for: #(#'pharo7.x' #'pharo8.x' #'pharo9.x')
		do: [ 
			spec
				package: 'Magritte-Pharo7-Model' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Tests-Pharo-Model' with: [ spec requires: #('Magritte-Pharo7-Model') ];
				package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo7-Model') ];
				" create a temporary alias "
				package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo7-Model'].

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
		for: #(#'pharo5.x' #'pharo6.x' #'pharo7.x' #'pharo8.x' #'pharo9.x')
		do: [ 
			"spec
				baseline: 'PharoEnhancements' with: [
					spec repository: 'github://seandenigris/Pharo-Enhancements' ]."
			spec 
				package: 'Magritte-Glamour' with: [ spec requires: #('Magritte-Model' 'Magritte-Morph') ];
				package: 'Magritte-GT' with: [ spec requires: #('Morphic' 'Magritte-Glamour') ];
				package: 'Magritte-Developer' with: [ spec requires: #('Magritte-Model') ].
			spec group: 'default' with: #('Magritte-GT' 'Magritte-Developer') ].
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
				group: 'default' with: 'Morphic' ].
		
		spec for: #GToolkit do: [ 
			spec 
				package: 'Magritte-UI' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-GToolkit' with: [ spec requires: #('Magritte-Model' 'Magritte-UI') ];
				package: 'Magritte-Developer' with: [ spec includes: #('Magritte-GToolkit') ].
			spec group: 'default' with: 'Magritte-GToolkit' ]
]

{ #category : #baselines }
BaselineOfMagritte >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec author: 'SeanDeNigris'.
			spec timestamp: '2015-04-05'.
			spec description: 'For pharo4.x, add Magritte-GT package and add it to the default group'.
			self baseline310CommonExtDeps: spec.
			spec
				package: 'Magritte-Model' with: [ 
					spec 
						requires: #('Grease');
						includes: #('Magritte-Deprecated3dot7') ];
				package: 'Magritte-Deprecated3dot7' with: [ spec requires: #('Magritte-Model' 'Magritte-Morph') ];
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
]

{ #category : #accessing }
BaselineOfMagritte >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #() ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #testing }
BaselineOfMagritte >> isGTImage [
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'GToolkit-' ]
]
