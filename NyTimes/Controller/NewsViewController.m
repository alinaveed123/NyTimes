//
//  ViewController.m
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import "NewsViewController.h"
#import "PrefixHeader.pch"
#import "CZPickerView.h"


@interface NewsViewController ()<CZPickerViewDataSource, CZPickerViewDelegate>
{
    
}
@property NSArray *periodsArray;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"New York Times";
    
    self.periodsArray = @[@"1", @"7", @"30"];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Load"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(LoadPeriodList:)];

    NSArray *buttonArray = [NSArray arrayWithObjects:item, nil];
    self.navigationItem.rightBarButtonItems = buttonArray;
    [self callWebserviceMostviewSections:@"7"];
    
}
-(void)LoadPeriodList:(id)sender {
    
    CZPickerView *picker = [[CZPickerView alloc] initWithHeaderTitle:@"Period Value" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
    picker.delegate = self;
    picker.dataSource = self;
    picker.needFooterView = YES;
    [picker show];
        
}
    

-(void)callWebserviceMostviewSections:(NSString *)Numbers
{
    
    NSString *webService = [NSString stringWithFormat:@"%@%@.json?api-key=%@",[GlobalObjects getBaseURLGeneral],Numbers,[GlobalObjects getAPIKey]];
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



- (NSAttributedString *)czpickerView:(CZPickerView *)pickerView
               attributedTitleForRow:(NSInteger)row{
    
    NSAttributedString *att = [[NSAttributedString alloc]
                               initWithString:self.periodsArray[row]
                               attributes:@{
                                            NSFontAttributeName:[UIFont fontWithName:@"Avenir-Light" size:18.0]
                                            }];
    return att;
}

- (NSString *)czpickerView:(CZPickerView *)pickerView
               titleForRow:(NSInteger)row{
    return self.periodsArray[row];
}

- (UIImage *)czpickerView:(CZPickerView *)pickerView imageForRow:(NSInteger)row {
    return nil;
}

- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView {
    return self.periodsArray.count;
}

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row {
    
    [self callWebserviceMostviewSections:self.periodsArray[row]];
}

- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemsAtRows:(NSArray *)rows {
   
}

- (void)czpickerViewDidClickCancelButton:(CZPickerView *)pickerView {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)czpickerViewWillDisplay:(CZPickerView *)pickerView {
}

- (void)czpickerViewDidDisplay:(CZPickerView *)pickerView {
}

- (void)czpickerViewWillDismiss:(CZPickerView *)pickerView {
}

- (void)czpickerViewDidDismiss:(CZPickerView *)pickerView {
}


@end
