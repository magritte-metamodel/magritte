private
buildReport
	^ (MAReport rows: self value description: self reference)
		sortEnabled: self magritteDescription isOrdered not;
		yourself