private
buildComponentTable
	^ self descriptionTable collect: [ :row :col :each |
		each componentClass
			memento: self
			description: each
			parent: self ]