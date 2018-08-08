versions
version304: spec
	<version: '3.0.4' imports: #('3.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		
		spec description: '3.0.4:
- updated version 3.0.3: use releases instead of fixed versions.'.
		spec author: 'DiegoLont'.
		spec timestamp: '16 January 2014'.
		spec 
			project: 'Grease' with: #'release1.0';
			project: 'Seaside3' with: #'release3.0'.
		spec 
			package: 'Magritte-Model' with: 'Magritte-Model-DiegoLont.449';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DiegoLont.38';
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
			package: 'Magritte-Pharo-Model' with: 'Magritte-Pharo-Model-DiegoLont.39';
			package: 'Magritte-Tests-Model' with: 'Magritte-Tests-Model-DamienCassou.33' ].
	
	spec for: #'gemstone' do: [
		spec project: 'GsCore' with: '0.242'.
		spec 
			package: 'Magritte-GemStone-Model' with: 'Magritte-GemStone-Model-NickAger.3';
			package: 'Magritte-Tests-GemStone-Model' with: 'Magritte-Tests-GemStone-Model-DaleHenrichs.1';
			package: 'Magritte-GemStone-Seaside' with: 'Magritte-GemStone-Seaside-DaleHenrichs.2'.].