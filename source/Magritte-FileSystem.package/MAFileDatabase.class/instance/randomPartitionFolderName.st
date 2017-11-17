private
randomPartitionFolderName
	"Returns a string between '00' to 'FF'"

	| twoCharacterHexString |
	twoCharacterHexString := 16rFF atRandom printStringBase: 16 length: 2 padded: true.
	^ twoCharacterHexString asLowercase.