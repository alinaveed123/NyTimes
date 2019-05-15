//
//  WebService.m
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

typedef void (^SuccessHandler)(id responseObject);
typedef void (^ErrorHandler)(NSError *error);

@interface WebService : NSObject<NSURLSessionDelegate>
{
    NSURLSessionDataTask *postDataTask;
    NSMutableURLRequest *mutablerequest;
}
@property(nonatomic,strong)   NSURLSession *session;
@property(nonatomic,strong)   NSURLSessionConfiguration *configuration;

+(id)sharedInstances;
-(void)commonMethodForGet:(NSString *)url
                  success:(void (^)(NSDictionary *dict))success
                     fail:(ErrorHandler)nonsuccess
           withController:(UIViewController *)caller;
@end
