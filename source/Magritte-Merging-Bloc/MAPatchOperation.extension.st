Extension { #name : #MAPatchOperation }

{ #category : #'*Magritte-Merging-Bloc' }
MAPatchOperation >> asElement [
	^ BlElement new
		layout: (BlLinearLayout horizontal cellSpacing: 10);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		addChild:
			(BrCheckbox new
				aptitude: BrGlamorousCheckboxAptitude;
				checked: self isEnabled;
				when: BrCheckboxChanged do: [ :evt | self isEnabled: evt isChecked ]);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: (self field label , ':') asRopedText);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: self oldValue displayString asRopedText;
				addEventHandlerOn: BlClickEvent
					do: [ :evt | evt target phlow spawnObject: self oldValue ]);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: ' > ' asRopedText);
		addChild:
			(BrLabel new
				aptitude: BrGlamorousLabelAptitude;
				text: self newValue displayString asRopedText;
				addEventHandlerOn: BlClickEvent
					do: [ :evt | evt target phlow spawnObject: self newValue ]);
		yourself
]
