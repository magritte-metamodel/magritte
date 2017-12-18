*Magritte-Model
descriptionString
	<magritteDescription>
	^ MAStringDescription new
			accessor: (MASelectorAccessor read: #asString write: #parseFrom:);
			yourself