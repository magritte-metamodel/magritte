actions
choose
	| calendar |
	calendar := WAMiniCalendar new.
	calendar
		date: ((self value notNil
			and: [ self magritteDescription isSatisfiedBy: self value ])
				ifFalse: [ Date current ]
				ifTrue: [ self value ]);
		selectBlock: [ :value | calendar answer: value ];
		canSelectBlock: [ :value | self magritteDescription isSatisfiedBy: value ].
	self chooser: calendar