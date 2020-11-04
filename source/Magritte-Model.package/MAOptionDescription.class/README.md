I am an abstract description of different options the user can choose from.

My options can be: 
- sorted or unsorted
- extensible or not i.e. can new options be added?

There are several ways to set my options:
- ${method:MAOptionDescription>>#options:|label='#options:'}$ is the most straightforward. You can just pass a collection of objects. If you want to dynamically construct the options, pass a ${class:MADynamicOptions}$.
- ${method:MAOptionDescription>>#optionsTextual:|label='#optionsTextual:'}$ does not, as it might suggest at first glance, use strings as options, but instead uses the ==reference== to convert the strings into domain objects.
- ${method:MAOptionDescription>>#optionsAndLabels:|label='#optionsAndLabels:'}$ - takes a collection where the values are the option objects, and the keys are the corresponding labels.

One inconsistency in the above is introduced by the implementation of dynamic options via ==#options:==. In that case, the actual options are not returned by ==#options==, but by ${method:MAOptionDescription>>#allOptions}$. So ==options== is actually misleading. And the proof is the fact that client code elsewhere in Magritte uses ==options== - which will not actually return dynamic options - instead of ==allOptions==:
[[[language=smalltalk
#options gtReferences & 'Magritte-' gtPackageMatches
]]]
Possible fixes might be:
- rename ==options[:]== to ==optionSource==
- have the ==options== getter return what's currently returned by ==allOptions==