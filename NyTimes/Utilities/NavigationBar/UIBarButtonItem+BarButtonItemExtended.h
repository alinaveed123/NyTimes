//
//  UIBarButtonItem+BarButtonItemExtended.h
//  CDCP
//
//  Created by Perry Chaturvedi on 8/26/14.
//  Copyright (c) 2014 P.S Intelegencia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (BarButtonItemExtended)

+ (UIBarButtonItem *)RightbarItemWithImage:(UIImage*)image target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)LeftbarItemWithImage:(UIImage*)image target:(id)target action:(SEL)action;
+ (UIBarButtonItem*)RightbarItemWithImageForPreview:(UIImage*)image target:(id)target action:(SEL)action;
+ (UIBarButtonItem*)CartItemWithImage:(UIImage*)image target:(id)target action:(SEL)action;
-(void)performBarButtonAction:(id)sender;

@end
