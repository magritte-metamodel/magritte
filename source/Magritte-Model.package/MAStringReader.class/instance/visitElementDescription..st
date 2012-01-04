visiting-description
visitElementDescription: aDescription
	"This implementation can be very dangerous and might lead to a potential security hole (this is tested), since the default implementation of #readFrom: in Object evaluates the expression to find its value. Most subclasses like Number, Date, Time, ... override this implementation, but some others (like Boolean) do not."

	self object: ([ aDescription kind readFrom: self stream ]
		on: Error do: [ :err | MAReadError signal: err messageText ])