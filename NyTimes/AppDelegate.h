//
//  AppDelegate.h
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, strong) UIView * currentView;

-(void)UCSHUD;
-(void)RemoveUCSHUD;
@end

