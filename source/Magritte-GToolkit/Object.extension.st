Extension { #name : 'Object' }

{ #category : '*Magritte-GToolkit' }
Object >> descriptionBrowse: aDescription [
	<magritteActionDescription: #descriptionBrowse>
	"Redundant because already provided by GToolkit"
	^ nil
]

{ #category : '*Magritte-GToolkit' }
Object >> descriptionFuelOut: desc [
	<magritteActionDescription: #descriptionFuelOut>
	^ desc
			gtIcon: [ BrGlamorousIcons savetodisk ];
			yourself
]

{ #category : '*Magritte-GToolkit' }
Object >> descriptionInspect: aDescription [
	<magritteActionDescription: #descriptionInspect>
	"Redundant because already provided by GToolkit"
	^ nil
]

{ #category : '*Magritte-GToolkit' }
Object >> gtActions [
	"Hack to extend GToolkit's actions. The GT mechanism is in ProtoObject, which is the only class we miss by hooking in here"
	^ super gtActions, self magritteGToolkitActions
]

{ #category : '*Magritte-GToolkit' }
Object >> maGtFormFor: aView [
	<gtView>
	| description |
	
	"Cache the description because this can be expensive and we want the view to be fast not to break the debugging workflow"
	description := self magritteDescription.
	
	(description isContainer not or: [ description isEmpty ]) ifTrue: [ ^ aView empty ].
	^ aView explicit
		title: 'Magritte';
		priority: 50;
		stencil: [ (description elementBuilderFor: self) addButtons; element ]
]

{ #category : '*Magritte-GToolkit' }
Object >> magritteElementBuilder [
	^ self magritteDescription elementBuilderFor: self
]

{ #category : '*Magritte-GToolkit' }
Object >> magritteGToolkitActions [
	^ self magritteActions children collect: [ :desc | desc gtActionFor: self ].
]
