accessing-properties
priority
	"Answer a number that is the priority of the receiving description. Priorities are used to give descriptions an explicit order by sorting them according to this number."

	^ self propertyAt: #priority ifAbsent: [ self class defaultPriority ]