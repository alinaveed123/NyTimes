//
//  MostViewTableviewCell.h
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import <UIKit/UIKit.h>
#import <YYWebImage/YYWebImage.h>


@class MostViewTableviewCell;
@protocol MostViewTableviewCellDelegate <NSObject>
-(void)didReorderClicked:(MostViewTableviewCell *)cell withIndex:(NSIndexPath *)indexPath;
-(void)didMoreDetailsClicked:(MostViewTableviewCell *)cell withIndex:(NSIndexPath *)indexPath;

@end

@interface MostViewTableviewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UILabel *lblNewsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPublishedBy;
@property (weak, nonatomic) IBOutlet UILabel *lblPublishDate;
@property (weak, nonatomic) IBOutlet UIImageView *imgNews;

@property (nonatomic, strong) NSIndexPath *cellIndexPath;
@property (nonatomic, assign)id <MostViewTableviewCellDelegate> delegate;
@end
