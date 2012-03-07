description building
for: anObject
	| cache |
	cache := MADynamicDescriptionCache value.
	
	MADynamicDescriptionCache use: cache during: [
		^ cache at: anObject ifAbsentPut: [ self build: anObject cache: cache ] ]