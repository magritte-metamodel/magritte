accessing-dynamic
reference
	"The reference within a ==*MARelationDescription*== is calculated automatically from all the classes of the receiver, if set to ==nil==. By setting the reference to a ==*MAContainer*== instance it is possible to customize the reference description."

	^ super reference ifNil: [ self commonClass magritteTemplate magritteDescription ]