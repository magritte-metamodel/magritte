accessing-properties
comment
	"Answer a comment or help-text giving a hint what this description is used for. GUIs that are built from this description might display it as a tool-tip."

	^ self propertyAt: #comment ifAbsent: [ self class defaultComment ]