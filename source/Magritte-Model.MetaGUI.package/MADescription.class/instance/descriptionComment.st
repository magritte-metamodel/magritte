acessing-magritte
descriptionComment
	<magritteDescription>
	^ MAMemoDescription new
		accessor: #comment;
		label: 'Comment';
		priority: 110;
		default: self class defaultComment;
		yourself