versions
version300: spec
	<version: '3.0' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		
		spec description: '3.0:
- #description replaced by #magritteDescription (#description deprecated)
- MAPragmaBuilder as default - model is now described using pragmas rather than #descriptionXXX naming convention.
- models are described on the instance side and built dynamically - no need for #magritteDynamicObject
- refactoring support (Magritte-Tools) transforms model descriptions into pragmas and moves descriptions from class to instance-side'.
		spec author: 'NickAger'.
		spec timestamp: '30 January 2012 12:55:56 pm'.
		spec 
			project: 'Grease' with: #'stable';
			project: 'Seaside30' with: #'stable'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-NickAger.425';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-NickAger.25';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.352';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.6' ].

	spec for: #'pharo' do: [
		spec 
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.25';
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-NickAger.62';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].