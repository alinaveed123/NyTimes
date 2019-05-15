//
//  MostViewTableviewCell.h
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//


#import "MostViewTableviewCell.h"

@implementation MostViewTableviewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)btnMoreDetailsCLicked:(id)sender{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didMoreDetailsClicked:withIndex:)]) {
        [self.delegate didMoreDetailsClicked:self withIndex:self.cellIndexPath];
    }
}


-(IBAction)btnReorderClicked:(id)sender{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(didReorderClicked:withIndex:)]) {
        [self.delegate didReorderClicked:self withIndex:self.cellIndexPath];
    }
}
@end
