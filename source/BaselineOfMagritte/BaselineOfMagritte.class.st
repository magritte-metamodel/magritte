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
		baseline: 'Grease' with: [ spec repository: 'github://SeasideSt/Grease:v1.18.0/repository' ];	
		baseline: 'Seaside3'
			with: [ "note: we do not want to depend on Zinc, since this is not present in Squeak. Currently no adapter is loaded"
			spec
				repository: 'github://SeasideSt/Seaside:master/repository';
				loads: #('Core') ]
]

{ #category : #baselines }
BaselineOfMagritte >> baseline330ForPharo: spec [
			
	spec for: #(#'pharo7.x' #'pharo8.x' #'pharo9.x' #'pharo10.x' #'pharo11.x' #'pharo12.x') do: [
		spec 
			baseline: 'PharoEnhancements' with: [ spec repository: 'github://seandenigris/Pharo-Enhancements' ].
		spec
			package: 'Magritte-Developer' with: [ spec requires: #('Magritte-Model') ];
			package: 'Magritte-FileSystem' with: [ spec requires: #('Magritte-Model') ];
			" create a temporary alias "
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo7-Model';
			package: 'Magritte-Tests-Files-Model' with: [ spec requires: #('Magritte-FileSystem') ];
			package: 'Magritte-Tests-Model' with: [ spec includes: #('Magritte-Tests-Files-Model') ].
		spec group: 'default' with: #('Magritte-Developer') ].
	
	spec for: #(#'pharo9.x') do: [
		spec
			package: 'Magritte-Pillar' 
				with: [ spec requires: #('Magritte-Model') "assumes Pillar is loaded, which is the case in P9 and GT before port to P10" ] ].
			
	
	spec for: #(#'pharo7.x' #'pharo8.x' #'pharo9.x') do: [ 
		spec
			package: 'Magritte-Glamour' with: [ spec requires: #('Magritte-Model' 'Magritte-Morph') ];
			package: 'Magritte-GT' with: [ spec requires: #('Magritte-Morph' 'Magritte-Glamour') ] ].
	
	spec for: #GToolkit do: [ 
		spec 
			package: 'Magritte-Developer' with: [ spec includes: #('Magritte-GToolkit') ];
			package: 'Magritte-GToolkit' with: [ spec requires: #('Magritte-Model' 'Magritte-UI') ];
			package: 'Magritte-Merging-Bloc' with: [ spec requires: #('Magritte-Merging') ];
			package: 'Magritte-UI' with: [ spec requires: #('Magritte-Model') ].
		spec group: 'default' with: #(#'Magritte-GToolkit' 'Magritte-Merging-Bloc') ].
]

{ #category : #baselines }
BaselineOfMagritte >> baseline330ForSqueakCommon: spec [

	spec for: #squeakCommon do: [
		spec
			package: 'Magritte-Bootstrap' with: [ spec requires: #('Magritte-Model') ];
			package: 'Magritte-Deprecated3dot7' with: [ spec requires: #('Magritte-Model' 'Magritte-Morph') ];
			package: 'Magritte-Merging' with: [ spec requires: #('Magritte-Model') ];
			package: 'Magritte-Model' with: [ spec includes: #('Magritte-Pharo-Model') ];
			package: 'Magritte-Money' with: [ spec requires: #('Magritte-Model') ];
			package: 'Magritte-Morph' with: [ spec requires: #('Magritte-Model') ];
			package: 'Magritte-Pharo-Model';				
			package: 'Magritte-Pharo-Seaside' with: [ spec requires: #('Magritte-Seaside') ];
			package: 'Magritte-Pharo-Tools' with: [ spec requires: #('Magritte-Deprecated') ];
			package: 'Magritte-Seaside' with: [ spec includes: #('Magritte-Pharo-Seaside') ];
			package: 'Magritte-Tests-Model'.
		spec
			group: 'Tools' with: #('Magritte-Pharo-Tools');
			group: 'default' with: #('Magritte-Morph') ].
			
	spec for: #notGToolkit do: [ 
		spec 
			package: 'Magritte-Model' with: [ spec includes: #('Magritte-NotGToolkit') ];
			package: 'Magritte-NotGToolkit' ]
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
				package: 'Magritte-Tests-Files-Model' with: [ spec requires: #('Grease' 'Magritte-Tests-Model') ];
				package: 'Magritte-Seaside' with: [ spec requires: #('Magritte-Model' 'Seaside3') ];
				package: 'Magritte-Bootstrap' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Deprecated' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Merging' with: [ spec requires: #('Magritte-Model') ];
				package: 'Magritte-Money' with: [ spec requires: #('Magritte-Model') ].
			spec
				group: 'Core' with: #('Magritte-Model');
				group: 'Tests' with: #('Magritte-Tests-Files-Model');
				group: 'Seaside' with: #('Magritte-Seaside');
				group: 'Deprecated' with: #('Magritte-Deprecated') ].
	self baseline330ForPharo: spec.
	self baseline330ForSqueakCommon: spec.
	self baseline300ForGemStone: spec
]

{ #category : #accessing }
BaselineOfMagritte >> customProjectAttributes [
	^ self isGTImage
			ifFalse: [ #(notGToolkit) ]
			ifTrue: [ #(GToolkit) ]
]

{ #category : #testing }
BaselineOfMagritte >> isGTImage [
	
	^ RPackageOrganizer default packageNames anySatisfy: [ :pn | pn beginsWith: 'Lepiter-' ].
	"Implementation note: used to check for GToolkit prefix, but P7 has a GToolkit-Examples package. Lepiter, OTOH, could only be loaded in a GT image"
]
