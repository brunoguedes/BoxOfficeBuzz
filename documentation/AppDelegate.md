File: BoxOfficeBuzz/AppDelegate.swift

# AppDelegate

## Summary
AppDelegate is a class that handles application-level functionality and responds to system events. It is used to customize the behavior of an application and respond to key events in the application's lifecycle.

## Methods
- `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool`
  Definition: Called after the application launches to allow for customization.
  Description: Override point for customization after application launch.
- `func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration`
  Definition: Called when a new scene session is being created.
  Description: Use this method to select a configuration to create the new scene with.
- `func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)`
  Definition: Called when the user discards a scene session.
  Description: Use this method to release any resources that were specific to the discarded scenes, as they will not return.

## Dependencies
- `UISceneConfiguration`
- `Bool`

