initialize-release
initializeCollider
	"Here we create the collider from a Game Mecha Collider asset. Note that the GitAssetloader should just be created once and cached (semi-) globally in your project. Assets can be added by going to Apps -> GitAssetBrowser. There you can add the assets. If you reuse assets often, it would also make sense to cache the colliders instead of loading them over and over again."

	| colliderAsset assetLoader |
	assetLoader := GitAssetLoader for: 'GameMecha'.
	colliderAsset := assetLoader loadAsset: 'assets/collider/DemoGameColliderAsset.GMC'.
	self collider: (GMCollider newFromAsset: colliderAsset withOwner: self)
