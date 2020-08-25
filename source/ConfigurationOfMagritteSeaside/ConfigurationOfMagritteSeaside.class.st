"
(ConfigurationOfMagritteSeaside project version: #stable) load
"
Class {
	#name : #ConfigurationOfMagritteSeaside,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfMagritteSeaside'
}

{ #category : #private }
ConfigurationOfMagritteSeaside class >> bootstrapPackage: aString from: aPath [ 
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

{ #category : #catalog }
ConfigurationOfMagritteSeaside class >> catalogContactInfo [
	^ 'Contact the Pharo mailing-list since this package is maintained by some active people on the mailing-list: S. Ducasse, S. Eggermont, S. De Nigris, E. Lorenzano and a couple of others.'
]

{ #category : #catalog }
ConfigurationOfMagritteSeaside class >> catalogDescription [

	^ 'Magritte Seaside a cool package to ease the creation of form in Seaside. It is based on magritte descriptions. Remember: you should not write forms in Seaside but use Seaside Magritte :). '
]

{ #category : #catalog }
ConfigurationOfMagritteSeaside class >> catalogKeywords [
	^ #(HTML web form metadata description)
	
]

{ #category : #private }
ConfigurationOfMagritteSeaside class >> ensureMetacello [
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
ConfigurationOfMagritteSeaside class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #'metacello tool support' }
ConfigurationOfMagritteSeaside class >> lastMetacelloVersionLoad [
	"Answer the last version loaded and the list of packages loaded for that version."

	LastVersionLoad == nil ifTrue: [ LastVersionLoad := nil -> 'default' ].
	^LastVersionLoad
]

{ #category : #loading }
ConfigurationOfMagritteSeaside class >> load [
	"self load"
	
	self project stableVersion load
]

{ #category : #'metacello tool support' }
ConfigurationOfMagritteSeaside class >> metacelloVersion: versionString loads: anArrayOrString [
	"Stash the last version loaded and the list of packages loaded for that version. The list
	 of packages will be used by the tools when doing 'Load Package Version'"

	LastVersionLoad := versionString -> anArrayOrString
]

{ #category : #accessing }
ConfigurationOfMagritteSeaside class >> project [

	^self new project
]

{ #category : #accessing }
ConfigurationOfMagritteSeaside >> project [

	^ project ifNil: [ | projectAttributes |
		"Bootstrap Metacello if it is not already loaded"
		self class ensureMetacello.
		"Construct Metacello project"
		project := (Smalltalk at: #MetacelloMCProject) new.
		projectAttributes := #().
		project projectAttributes:  projectAttributes.
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear ]
]

{ #category : #version }
ConfigurationOfMagritteSeaside >> release35: spec [ 
	<version: 'release3.5'>
	
	spec 
		for: #'common'
		do: [ 
			spec
				project: 'Magritte3' with: [ 
					spec
						className: 'ConfigurationOfMagritte3';
						versionString: #'release3.5';
						loads: #( 'Seaside' );
						repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main/' ] ]
]

{ #category : #version }
ConfigurationOfMagritteSeaside >> stable: spec [ 
	<symbolicVersion: #stable>
	
	spec for:#common version: 'release3.5'
]
