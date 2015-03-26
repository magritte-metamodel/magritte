visiting-description
visitElementDescription: anObject

	anObject isVisible ifTrue: [ | maMorphicModel |
		maMorphicModel := anObject morphClass
			memento: self builder memento
			description: anObject
			parent: self builder.
		self builder morph addMorphBack: maMorphicModel morph ]