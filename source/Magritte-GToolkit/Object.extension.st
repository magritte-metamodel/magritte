Extension { #name : #Object }

{ #category : #'*Magritte-GToolkit' }
Object >> descriptionBrowse: aDescription [
	<magritteActionDescription: #descriptionBrowse>
	"Redundant because already provided by GToolkit"
	^ nil
]

{ #category : #'*Magritte-GToolkit' }
Object >> descriptionFuelOut: desc [
	<magritteActionDescription: #descriptionFuelOut>
	^ desc
			gtIcon: [ BrGlamorousIcons savetodisk ];
			yourself
]

{ #category : #'*Magritte-GToolkit' }
Object >> descriptionInspect: aDescription [
	<magritteActionDescription: #descriptionInspect>
	"Redundant because already provided by GToolkit"
	^ nil
]

{ #category : #'*Magritte-GToolkit' }
Object >> gtActions [
	"Hack to extend GToolkit's actions. The GT mechanism is in ProtoObject, which is the only class we miss by hooking in here"
	^ super gtActions, self magritteGToolkitActions
]

{ #category : #'*Magritte-GToolkit' }
Object >> maGtFormFor: aView [
	<gtView>
	(self magritteDescription isContainer not or: [ self magritteDescription isEmpty ]) ifTrue: [ ^ aView empty ].
	^ aView explicit
		title: 'Magritte';
		priority: 50;
		stencil: [ self magritteElementBuilder addButtons; element ]
]

{ #category : #'*Magritte-GToolkit' }
Object >> magritteElementBuilder [
	^ MAElementBuilder buildElementFor: self
]

{ #category : #'*Magritte-GToolkit' }
Object >> magritteGToolkitActions [
	^ self magritteActions children collect: [ :desc | desc gtActionFor: self ].
]
