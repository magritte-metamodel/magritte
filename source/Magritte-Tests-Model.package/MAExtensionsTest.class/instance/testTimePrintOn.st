tests-time
testTimePrintOn
	| stream |
	stream := String new writeStream.
	Time now print24: true showSeconds: true on: stream.
	
	self assert: (stream contents size) = 15.
	self assert: (stream contents at: 3) = $:.
	self assert: (stream contents at: 6) = $: