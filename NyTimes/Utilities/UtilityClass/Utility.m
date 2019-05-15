//
//  Utility.m
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import "Utility.h"
#import "FCAlertView.h"


@implementation Utility


+ (void)showUIAlertView:(NSString*)title msg:(NSString*)Message withAlertType:(NSString *)type withController :(UIViewController*)viewController{
    
    if ([Message isKindOfClass:[NSNull class]]) {
        Message = @"";
    }

    // ADDING AND INITIALIZING FCALERTVIEW
    FCAlertView *alert = [[FCAlertView alloc] init]; // 2) Add This Where you Want to Create an FCAlertView
    
    // Setting FCAlertView's Alert Type
    if ([type isEqualToString:@"Success"]) {
        [alert makeAlertTypeSuccess];
    }else{
        [alert makeAlertTypeWarning];
    }
    
    // Dismissing FCAlertView with touch on outside of view
    alert.dismissOnOutsideTouch = 1;
    
    // Hiding Done Button in FCAlertView
    alert.hideDoneButton = 0;
    
    // Hiding All Buttons in FCAlertView
    alert.hideAllButtons = 0;
    
    // Avoiding Custom Image Tint
    alert.avoidCustomImageTint = 0;
    
    // Blur Background Effect
    alert.blurBackground = 0.5;
    
    // Bounce Animations Effect
    alert.bounceAnimations = 1;
    
    // Alert Round/Detach Buttons
    alert.detachButtons = YES;
    alert.animateAlertInFromTop = NO;
    alert.animateAlertOutToBottom= NO;
    
    [alert showAlertWithTitle:title
                 withSubtitle:Message
              withCustomImage:nil
          withDoneButtonTitle:nil
                   andButtons:nil];
}


@end

