*Magritte-Pillar
maPillarPushTo: stack do: aBlock
	self do: [ :e | 
		stack top add: e.
		stack push: e ].
	aBlock value.
	self size timesRepeat: [ stack pop ]