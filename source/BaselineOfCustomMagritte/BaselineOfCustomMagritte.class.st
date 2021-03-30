Class {
	#name : #BaselineOfCustomMagritte,
	#superclass : #BaselineOf,
	#category : #BaselineOfCustomMagritte
}

{ #category : #baselines }
BaselineOfCustomMagritte >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec
				baseline: 'CustomGrease' with: [ spec repository: 'github://pavel-krivanek/Grease:cutom/repository' ];
				package: 'Magritte-Model';
				package: 'Magritte-Tests-Model' ]
]
