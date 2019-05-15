//
//  Utility.h
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utility : NSObject

+ (void)showUIAlertView:(NSString*_Nullable)title msg:(NSString* _Nullable)Message withAlertType:(NSString * _Nullable)type withController :(UIViewController* _Nullable)viewController;
@end
