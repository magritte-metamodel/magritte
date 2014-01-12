private
currentValueMorph

	| exists |
	exists := rectangleMorph submorphs size = 2.
	exists ifFalse: [ rectangleMorph addMorph: StringMorph new ].
	^ rectangleMorph submorphs first.