//
//  AppDelegate.h
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, strong) UIView * currentView;
@property (nonatomic,strong) Reachability *internetReachability;

@property (nonatomic,assign) BOOL connectionAvalablity;

-(void)UCSHUD;
-(void)RemoveUCSHUD;
-(BOOL)CheckInternetConnection;
@end

