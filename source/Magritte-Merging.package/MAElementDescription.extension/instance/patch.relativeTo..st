*Magritte-Merging
patch: target relativeTo: base 
	| oldValue newValue |
	oldValue := self read: base.
	newValue := self read: target.
	^ newValue patchRelativeToBase: oldValue as: self of: base.