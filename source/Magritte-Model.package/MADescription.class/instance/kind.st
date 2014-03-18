accessing
kind
	"Answer the base-class (type) the receiver is describing. The default implementation answers the most generic class: Object, the root of the Smalltalk class hierarchy. Subclasses might refine this choice."

	^ self propertyAt: #kind ifAbsent: [ self class defaultKind ]