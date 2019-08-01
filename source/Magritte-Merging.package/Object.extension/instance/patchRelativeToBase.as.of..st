*Magritte-Merging
patchRelativeToBase: oldValue as: description of: receiver 

		^ (receiver is: self anInterestingReplacementFor: oldValue)
				ifTrue: [ 
					MAPatchOperation new 
						receiver: receiver;
						field: description;
						oldValue: oldValue;
						newValue: self ]
				ifFalse: [ nil ].