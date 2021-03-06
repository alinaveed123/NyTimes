//
//  AppDelegate.m
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import "AppDelegate.h"
#import "BaseClass.h"
#import "CustomIndicator.h"
#import "constant.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.connectionAvalablity = NO;
    [self checkNetworkAvailability];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)UCSHUD
{
    if (_currentView != NULL) {
        return;
    }
    
    CustomIndicator * viewController = [[CustomIndicator alloc]initWithNibName:@"CustomIndicator" bundle:[NSBundle mainBundle]];
    viewController.view.frame = DEVICE_FRAME;
    _currentView = viewController.view;
    [[[[UIApplication sharedApplication] delegate]window] addSubview:_currentView];
}

-(void)RemoveUCSHUD{
    
    [_currentView removeFromSuperview];
    [[[[UIApplication sharedApplication] delegate]window] setNeedsLayout];
    _currentView = nil;
}


-(void)checkNetworkAvailability
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
}

- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    BOOL flag;
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    
    switch (netStatus)
    {
        case NotReachable: {
            flag=NO;
            break;
        }
        case ReachableViaWWAN: {
            flag=YES;
            break;
        }
        case ReachableViaWiFi: {
            flag=YES;
            break;
        }
    }
    if (flag) {
        _connectionAvalablity=YES;
        
    } else {
        _connectionAvalablity=NO;
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:notifyRechability object:nil];
}

-(BOOL)CheckInternetConnection{
    return self.connectionAvalablity;
}
@end
