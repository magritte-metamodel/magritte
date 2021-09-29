*Magritte-Pillar
maPillarPushTo: stack do: aBlock
	stack top add: self.
	stack push: self.
	aBlock value.
	stack pop