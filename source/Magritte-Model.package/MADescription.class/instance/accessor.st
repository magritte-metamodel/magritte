accessing
accessor
	"Answer the access-strategy of the model-value described by the receiver."

	^ accessor ifNil: [ accessor := self class defaultAccessor ]