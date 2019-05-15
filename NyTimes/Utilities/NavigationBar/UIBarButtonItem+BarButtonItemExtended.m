//
//  UIBarButtonItem+BarButtonItemExtended.m
//  CDCP
//
//  Created by Perry Chaturvedi on 8/26/14.
//  Copyright (c) 2014 P.S Intelegencia. All rights reserved.
//

#import "UIBarButtonItem+BarButtonItemExtended.h"

@implementation UIBarButtonItem (BarButtonItemExtended)

+ (UIBarButtonItem*)RightbarItemWithImage:(UIImage*)image target:(id)target action:(SEL)action
{
    UIButton *rightImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightImageButton setImage:image forState:UIControlStateNormal];

        NSLayoutConstraint * widthConstraint = [rightImageButton.widthAnchor constraintEqualToConstant:35];
        NSLayoutConstraint * HeightConstraint =[rightImageButton.heightAnchor constraintEqualToConstant:35];
        [widthConstraint setActive:YES];
        [HeightConstraint setActive:YES];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightImageButton];
    
    if(action) {
        [rightImageButton addTarget:rightBarButton action:@selector(performBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    [rightBarButton setAction:action];
    [rightBarButton setTarget:target];
    
    return rightBarButton;
}

+ (UIBarButtonItem*)RightbarItemWithImageForPreview:(UIImage*)image target:(id)target action:(SEL)action
{
    UIButton *rightImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightImageButton setBackgroundImage:image forState:UIControlStateNormal];
  
        NSLayoutConstraint * widthConstraint = [rightImageButton.widthAnchor constraintEqualToConstant:20];
        NSLayoutConstraint * HeightConstraint =[rightImageButton.heightAnchor constraintEqualToConstant:20];
        [widthConstraint setActive:YES];
        [HeightConstraint setActive:YES];

    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightImageButton];
    
    if(action) {
        [rightImageButton addTarget:rightBarButton action:@selector(performBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    [rightBarButton setAction:action];
    [rightBarButton setTarget:target];
    
    return rightBarButton;
}


+ (UIBarButtonItem *)LeftbarItemWithImage:(UIImage*)image target:(id)target action:(SEL)action {
    
    UIButton *leftImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftImageButton setBackgroundImage:image forState:UIControlStateNormal];

        NSLayoutConstraint * widthConstraint = [leftImageButton.widthAnchor constraintEqualToConstant:20];
        NSLayoutConstraint * HeightConstraint =[leftImageButton.heightAnchor constraintEqualToConstant:20];
        [widthConstraint setActive:YES];
        [HeightConstraint setActive:YES];
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:leftImageButton];
    
    if(action) {
        [leftImageButton addTarget:leftBarButton action:@selector(performBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [leftBarButton setAction:action];
    [leftBarButton setTarget:target];
    
    return leftBarButton;
}

+ (UIBarButtonItem*)CartItemWithImage:(UIImage*)image target:(id)target action:(SEL)action
{
    UIButton *rightImageButton;
    rightImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightImageButton setImage:image forState:UIControlStateNormal];
    rightImageButton.frame = CGRectMake(0.0, 0.0, 30, 30);

    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:rightImageButton];

    if(action) {
        [rightImageButton addTarget:rightBarButton action:@selector(performBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }

    [rightBarButton setAction:action];
    [rightBarButton setTarget:target];
    return rightBarButton;
}

-(void)performBarButtonAction:(UIButton*)sender
{
    [[self target] performSelector:self.action withObject:self afterDelay:0.0f];
}

@end
