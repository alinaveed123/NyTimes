//
//  NewsDetatilsViewController.h
//  NyTimes
//
//  Created by ALI Naveed on 5/15/19.
//

#import <UIKit/UIKit.h>
#import "Results.h"
#import <YYWebImage/YYWebImage.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetatilsViewController : UIViewController<UIGestureRecognizerDelegate>
@property(nonatomic,retain)Results *newsDetails;
@property(nonatomic,retain)IBOutlet UILabel *NewsTitle;
@property(nonatomic,retain)IBOutlet UILabel *NewsAbstract;
@property(nonatomic,retain)IBOutlet UILabel *NewsbyLine;
@property(nonatomic,retain)IBOutlet UILabel *NewsDate;
@property(nonatomic,retain)IBOutlet UIImageView *Newsimage;

@end

NS_ASSUME_NONNULL_END
