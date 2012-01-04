private
descriptionInstance
	^ MAContainer with: (MAStringDescription new
			default: self defaultInstance;
			accessor: #value;
			yourself)