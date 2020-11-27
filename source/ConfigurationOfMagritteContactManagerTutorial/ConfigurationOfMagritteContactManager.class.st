"
(ConfigurationOfMagritteContactManager project version: '1.0') load
"
Class {
	#name : #ConfigurationOfMagritteContactManager,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfMagritteContactManagerTutorial'
}

{ #category : #'development support' }
ConfigurationOfMagritteContactManager class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfMagritteContactManager class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #catalog }
ConfigurationOfMagritteContactManager class >> catalogContactInfo [
	^ 'Contact  S. Ducasse'
]

{ #category : #catalog }
ConfigurationOfMagritteContactManager class >> catalogDescription [

	^ 'Magritte-ContactManager is a little tutorial on Magritte. '
]

{ #category : #catalog }
ConfigurationOfMagritteContactManager class >> catalogKeywords [
	^ #(HTML web form metadata description example tutorial)
	
]

{ #category : #private }
ConfigurationOfMagritteContactManager class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfMagritteContactManager class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfMagritteContactManager class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfMagritteContactManager class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfMagritteContactManager class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfMagritteContactManager class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfMagritteContactManager class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfMagritteContactManager class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfMagritteContactManager >> baseline10: spec [
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec description: 'First Full Configuration'.
		spec author: 'StephaneDucasse'.
		spec timestamp: '8/10/2015'.
		spec repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main'.
		
		spec project: 'MagritteSeaside'
			with: [ 
					spec
						className: 'ConfigurationOfMagritteSeaside';
						versionString: #stable;
						repository: 'http://smalltalkhub.com/Magritte/Magritte3/main'.].
		spec
				package: 'Magritte-ContactManager' with: [ spec requires: 'MagritteSeaside' ]]
		
	

]

{ #category : #accessing }
ConfigurationOfMagritteContactManager >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritteContactManager >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.0-baseline'.

]

{ #category : #accessing }
ConfigurationOfMagritteContactManager >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfMagritteContactManager >> version: spec [ 
	<version: '1.0' imports: #('1.0-baseline')>
	
	spec for: #'common' do: [
		spec blessing: #'release'.
		spec description: 'Skeleton to start the magritte contact manager tutorial'.
		spec author: 'Stéphane Ducasse'.
		spec timestamp: '2015/10/08'.
		spec 
			package: 'Magritte-ContactManager' with: 'Magritte-ContactManager-StephaneDucasse.1'.
		 ].

	
]
