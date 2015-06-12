*magritte-model-model
initializeMagritte
	"Initializes the receiving object with the default values of its description."

	self magritteDescription do: [ :each |
		each isReadonly
			ifFalse: [ self write: each default using: each ] ]