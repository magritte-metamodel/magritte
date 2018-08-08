tests-accessing
testOptionsTextual
	self description optionsTextual: 'a' , (String with: Character cr) , 'b'.
	self assert: self description optionsTextual = ('a' , (String with: Character cr) , 'b').
	self assert: self description options = #( 'a' 'b' )