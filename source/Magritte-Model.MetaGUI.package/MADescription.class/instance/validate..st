validation
validate: anObject
	"Validate ==anObject== in the context of the describing-receiver, raises an error in case of a problem. If ==anObject== is ==nil== and not required, most tests will be skipped. Do not override this message, instead have a look at ==#validateSpecific:== what is usually a better place to define the behaviour your description requires."

	self validator on: anObject description: self