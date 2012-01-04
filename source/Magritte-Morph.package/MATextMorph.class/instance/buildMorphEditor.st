private
buildMorphEditor
	^ UITheme current 
		newTextEntryIn: nil 
		for: self  
		get: #string  
		set: #string: 
		class: String
		getEnabled: #enabled 
		help: self description comment