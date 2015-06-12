accessing-properties
group
	"Answer the group of the receiving description. The group is a string used to categorize and group descriptions. Certain display interpreters with be able to use this information to improve the usability."

	^ self propertyAt: #group ifAbsent: [ self class defaultGroup ]