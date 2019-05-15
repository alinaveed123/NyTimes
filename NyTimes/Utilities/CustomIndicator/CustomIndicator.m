//
//  CustomerIndicator.m
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import "CustomIndicator.h"
@interface CustomIndicator ()

@end

@implementation CustomIndicator

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSData* imagedata = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Newyork" ofType:@"gif"]];
    UIImage* anImage = [UIImage animatedImageWithAnimatedGIFData:imagedata];
    _imgGif.image = anImage;
    _lblLoading.text = @"Loading";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
