versions
version300: spec
	<version: '3.0' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		
		spec description: '3.0:
- #description replaced by #magritteDescription (#description deprecated)
- MAPragmaBuilder as default - model is now described using pragmas rather than #descriptionXXX naming convention.
- models are described on the instance side and built dynamically - no need for #magritteDynamicObject
- refactoring support (Magritte-Tools) transforms model descriptions into pragmas and moves descriptions from class to instance-side.
Updated configuration to use Seaside3'.
		spec author: 'NickAger'.
		spec timestamp: '30 January 2012 12:55:56 pm'.
		spec 
			project: 'Grease' with: '1.0.8';
			project: 'Seaside3' with: '3.0.8'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-NickAger.431';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.32';
			package: 'Magritte-Seaside' with: 'Magritte-Seaside-NickAger.355';
			package: 'Magritte-Deprecated' with: 'Magritte-Deprecated-NickAger.7' ].

	spec for: #'squeakCommon' do: [
		spec 
			package: 'Magritte-Tests-Pharo-Model' with: 'Magritte-Tests-Pharo-Model-lr.4';
			package: 'Magritte-Pharo-Seaside' with: 'Magritte-Pharo-Seaside-lr.5';
			package: 'Magritte-Morph' with: 'Magritte-Morph-NickAger.63';
			package: 'Magritte-Pharo-Tools' with: 'Magritte-Pharo-Tools-NickAger.3' ].
	spec for: #'squeak' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-NickAger.26' ].
	spec for: #'pharo' do: [
		spec
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.27' ].
	spec for: #'pharo3.x' do: [ 
		spec
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33'].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].