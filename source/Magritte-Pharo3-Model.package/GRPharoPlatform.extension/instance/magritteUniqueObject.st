*Magritte-Pharo3-Model
magritteUniqueObject
	"Answer a random object, such as a UUID, that is extremely likely to
	be unique over space and time."

	^ ByteArray withAll: UUID new