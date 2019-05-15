//
//  ViewController.m
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import "NewsViewController.h"
#import "WebService.h"
#import "GlobalObjects.h"
#import "Constant.h"
#import "AppDelegate.h"
#import "BaseClass.h"
#import "Results.h"
#import "Media.h"
#import "MostViewTableviewCell.h"
#import "MediaMetadata.h"
#import "Utility.h"
#import "Constant.h"
#import "NewsDetatilsViewController.h"
@interface NewsViewController ()
{
    
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"New York Times";
    
    [self callWebserviceMostviewSections];
    
}

-(void)callWebserviceMostviewSections
{
    
    NSString *webService = [NSString stringWithFormat:@"%@7.json?api-key=%@",[GlobalObjects getBaseURLGeneral],[GlobalObjects getAPIKey]];
    [[WebService sharedInstances] commonMethodForGet:webService success:^(NSDictionary *dict) {
        
        //Loading date from background thread to main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
           [appdel RemoveUCSHUD];
            BaseClass *base = [[BaseClass alloc] initWithDictionary:dict];
            if([base.status isEqualToString:@"OK"])
            {
                self.arrMostviews = [[NSMutableArray alloc] initWithArray:base.results];
                [self.tblMostViewSections reloadData];
            }
        });
    } fail:^(NSError *error) {
        [appdel RemoveUCSHUD];
    } withController:self];
}



#pragma mark - TableView DataSource Implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  _arrMostviews.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"MostViewTableviewCell";
    
    MostViewTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    Results* locaDic = [_arrMostviews objectAtIndex:indexPath.row];
    
    cell.tag = indexPath.row;
    cell.cellIndexPath = indexPath;
    
    cell.lblNewsTitle.text = locaDic.title;
    cell.lblPublishedBy.text = locaDic.byline;
    cell.lblPublishDate.text = locaDic.publishedDate;
    
    MediaMetadata *metaData = [[[locaDic.media objectAtIndex:0] mediaMetadata] objectAtIndex:0];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",metaData.urlString]];
    [cell.imgNews yy_setImageWithURL:url options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Results* locaDic = [_arrMostviews objectAtIndex:indexPath.row];
    NewsDetatilsViewController *listobject = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetatilsViewController"];
    listobject.newsDetails = locaDic;
    [self.navigationController pushViewController:listobject animated:YES];
}




@end
