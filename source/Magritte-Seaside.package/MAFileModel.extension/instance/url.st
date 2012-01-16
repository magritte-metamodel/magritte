*magritte-seaside-accessing
url
	"Answer a link to a request handler for the given file."
	| handler |
	handler := MAFileModelHandler on: self.
	^ WACurrentRequestContext value registry
		register: handler;
		urlFor: handler