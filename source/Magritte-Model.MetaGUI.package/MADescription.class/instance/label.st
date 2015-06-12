accessing-properties
label
	"Answer the label of the receiving description. The label is mostly used as an identifier that is printed next to the input field when building a GUI from the receiver."

	^ self propertyAt: #label ifAbsent: [ self class defaultLabel ]