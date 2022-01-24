Class {
	#name : #BaselineOfMagritteForGToolkit,
	#superclass : #BaselineOf,
	#category : #BaselineOfMagritteForGToolkit
}

{ #category : #baselines }
BaselineOfMagritteForGToolkit >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'Grease'
			with: [ 
			spec repository: 'github://feenkcom/Grease:feenk/repository' ].

		spec
			package: 'Magritte-Model'
			with: [ spec requires: #( 'Grease' ) ] ]
]
