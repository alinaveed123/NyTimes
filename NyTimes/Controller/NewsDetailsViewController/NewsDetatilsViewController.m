//
//  NewsDetatilsViewController.m
//  NyTimes
//
//  Created by ALI Naveed on 5/15/19.
//

#import "NewsDetatilsViewController.h"
#import "MediaMetadata.h"
#import "Media.h"
#import "UIBarButtonItem+BarButtonItemExtended.h"

@interface NewsDetatilsViewController ()

@end

@implementation NewsDetatilsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"News Details";
    UIBarButtonItem *backBtn =[UIBarButtonItem RightbarItemWithImage:[UIImage imageNamed:@"back_white"] target:self action:@selector(CalledBack)];
    NSArray *buttonArray = [NSArray arrayWithObjects:backBtn, nil];
    self.navigationItem.leftBarButtonItems = buttonArray;
    
  
    Results* NewsDetails = self.newsDetails;
    self.NewsTitle.text = NewsDetails.title;
    self.NewsAbstract.text = NewsDetails.abstract;
    self.NewsbyLine.text = NewsDetails.byline;
    self.NewsDate.text = NewsDetails.publishedDate;
    MediaMetadata *metaData = [[[NewsDetails.media objectAtIndex:0] mediaMetadata] objectAtIndex:0];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",metaData.urlString]];
    [self.Newsimage yy_setImageWithURL:url options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
    // Do any additional setup after loading the view.
}

-(void)CalledBack{
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
