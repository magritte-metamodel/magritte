private
buildReport
	^ (MAReport rows: self value description: self reference)
		sortEnabled: self description isOrdered not;
		yourself