A GMResourceLoader is an abstract class which bundles shared behavior of the specific resource loaders.
A specific ResourceLoader acts as a cache for its supported Types. Furthermore:
	All resources from a folder can be loaded. 
	Specific resources can be loaded from a supplied directory. The directory has to be within the resource folder of squeak.
	Resources can be loaded from drive and stored in methods. It is recommended to not use the resources stored in methods but rather cache them before using them.
	Objects can be loaded into the cache from drive or already created objects.

