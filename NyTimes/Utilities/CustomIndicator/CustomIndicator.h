//
//  CustomerIndicator.h
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import <UIKit/UIKit.h>
#import "UIImage+animatedGIF.h"

@interface CustomIndicator : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imgGif;
@property (weak, nonatomic) IBOutlet UILabel *lblLoading;
@end
