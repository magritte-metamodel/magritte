copying
postCopy
	"This method is called whenever a shallow copy of the receiver is made. Redefine this method in subclasses to copy other fields as necessary. Never forget to call super, else class invariants might be violated."

	super postCopy.
	properties := properties copy