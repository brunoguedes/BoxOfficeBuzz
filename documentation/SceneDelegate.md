File: BoxOfficeBuzz/SceneDelegate.swift

# SceneDelegate
## Summary
SceneDelegate is a class that conforms to the UIResponder and UIWindowSceneDelegate protocols, providing methods to handle scene-related events and manage the UIWindow instance.

## Instance Variables
- `window: UIWindow?` - The UIWindow instance associated with the scene.

## Methods
- `func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions)` - Called when the scene is about to connect to a session, providing an opportunity to configure and attach the UIWindow to the scene.
- `func sceneDidDisconnect(_ scene: UIScene)` - Called when the scene is being released by the system, allowing for the release of resources associated with the scene.
- `func sceneDidBecomeActive(_ scene: UIScene)` - Called when the scene becomes active, allowing for the restart of tasks that were paused or not yet started when the scene was inactive.
- `func sceneWillResignActive(_ scene: UIScene)` - Called when the scene will move from an active state to an inactive state, allowing for the preparation of the scene for temporary interruptions.
- `func sceneWillEnterForeground(_ scene: UIScene)` - Called when the scene transitions from the background to the foreground, allowing for the undoing of changes made on entering the background.
- `func sceneDidEnterBackground(_ scene: UIScene)` - Called when the scene transitions from the foreground to the background, allowing for the saving of data, release of shared resources, and storage of scene-specific state information.

## Dependencies
- `UIWindow`

