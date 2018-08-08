tests-integer
testFileSize
	self assert: (1000) asFileSize = '1000 B'.
	self assert: (1024) asFileSize = '1 KB'.

	self assert: (1000 * 1000) asFileSize = '976 KB'.
	self assert: (1024 * 1024) asFileSize = '1 MB'.

	self assert: (1000 * 1000 * 1000) asFileSize = '953 MB'.
	self assert: (1024 * 1024 * 1024) asFileSize = '1 GB'.

	self assert: (1000 * 1000 * 1000 * 1000) asFileSize = '931 GB'.
	self assert: (1024 * 1024 * 1024 * 1024) asFileSize = '1 TB'.

	" etc "