private
newRelation

	| instance |
	instance := self selected new.
	self magritteDescription initializer value: instance.
	^ instance
