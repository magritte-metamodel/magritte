rendering
renderRemoveOn: html
	html render: self value.
	html text: ' ('; render: self value filesize asFileSize; text: ') '.
	html submitButton on: #remove of: self