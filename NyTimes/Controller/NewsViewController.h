//
//  ViewController.h
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)IBOutlet UITableView* tblMostViewSections;
@property(nonatomic,strong)NSMutableArray* arrMostviews;

@end

