Class {
	#name : #BaselineOfMagritteForGt,
	#superclass : #BaselineOf,
	#category : #BaselineOfMagritteForGt
}

{ #category : #baseline }
BaselineOfMagritteForGt >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec
			baseline: 'Grease'
			with: [ 
			spec repository: 'github://SeasideSt/Grease:v1.7.x/repository' ].

		spec
			package: 'Magritte-Model'
			with: [ spec requires: #( 'Grease' ) ].

		spec
			package: 'Magritte-Pharo-Model'
			with: [ spec requires: #( 'Magritte-Model' ) ].

		spec
			package: 'Magritte-UI'
			with: [ spec requires: #( 'Magritte-Model' ) ].

		spec
			package: 'Magritte-GToolkit'
			with: [ spec requires: #( 'Magritte-Model' 'Magritte-UI' ) ] ]
]
