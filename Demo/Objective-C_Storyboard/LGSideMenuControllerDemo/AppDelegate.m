//
//  AppDelegate.m
//  LGSideMenuControllerDemo
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Uncomment to show application Home directory
    // NSString *homeDir = NSHomeDirectory();
    // NSLog(@"homedir: %@",homeDir);
    
    // RETRIEVING USER DEFAULTS
    /*
     At launch time, an app should register default values for any preferences that it expects to be present and valid. When you request the value of a preference that has never been set, the methods of the NSUserDefaults class return default values that are appropriate for the data type. For numerical scalar values, this typically means returning 0, but for strings and other objects it means returning nil. If these standard default values are not appropriate for your app, you can register your own default values using the registerDefaults: method. This method places your custom default values in the NSRegistrationDomain domain, which causes them to be returned when a preference is not explicitly set.
     */
    // Update version information and date in Device Settings
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    // self.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginController"]; // OLD
    UINavigationController *navigationController = [storyboard instantiateViewControllerWithIdentifier:@"NavigationController"];
    [navigationController setViewControllers:@[[storyboard instantiateViewControllerWithIdentifier:@"ViewController"]]];

    MainViewController *mainViewController = [storyboard instantiateInitialViewController];
    
    mainViewController.rootViewController = navigationController;
    
    [mainViewController setupWithType:2];
    
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    window.rootViewController = mainViewController;
    
    [UIView transitionWithView:window
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:nil
                    completion:nil];

    NSLog(@"UIDevice identifierForVendor = %@", [[[UIDevice currentDevice] identifierForVendor] UUIDString]);
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"[EMOS1iOS] : applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"[EMOS1iOS] : applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"[EMOS1iOS] : applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"[EMOS1iOS] : applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"[EMOS1iOS] : applicationWillTerminate");
}

- (void) applicationDidReceiveMemoryWarning:(UIApplication *)application {
    NSLog(@"[EMOS1iOS] : applicationDidReceiveMemoryWarning");
}


@end
