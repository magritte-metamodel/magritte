symbolic versions
release3: spec 
	<symbolicVersion: #'release3'>
	
	spec for: #'common' version: #'release3.5'.
	" A release should run without errors ... "
	spec for: #'pharo2.x' version: #'release3.2'.
	spec for: #'pharo3.x' version: #'release3.2'.
	spec for: #'pharo4.x' version: #'release3.2'