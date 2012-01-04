accessing-description
descriptionComment
	<magritte>
	^ MAMemoDescription new
		accessor: #comment;
		label: 'Comment';
		priority: 110;
		default: self defaultComment;
		yourself