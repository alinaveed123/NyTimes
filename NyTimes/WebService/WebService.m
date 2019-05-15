//
//  WebService.m
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//
#import "WebService.h"

@implementation WebService
@synthesize session,configuration;

+(id)sharedInstances
{
    static WebService *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void)headerMethodWithserverUrl:(NSString *)userUrl{
    NSURL *baseURL = [NSURL URLWithString:userUrl];
    NSString* method = @"";
     method = @"GET";
    
    mutablerequest = [NSMutableURLRequest requestWithURL:baseURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [mutablerequest setHTTPMethod:method];
    [mutablerequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
}


-(void)commonMethodForGet:(NSString *)url success:(void (^)(NSDictionary *dict))success fail:(ErrorHandler)nonsuccess
{
    [self headerMethodWithserverUrl:url];
    
    configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 60.0;
    session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    
    postDataTask = [session dataTaskWithRequest:mutablerequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if(error == nil)
        {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            if ([httpResponse statusCode] == 401) {
                //[self ForStatuscode];
            }
            NSDictionary *result=[NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

            if (result)
            {
                success(result);
            }
            else
            {
                nonsuccess(error);
            }
        }
        else
        {
            nonsuccess(error);
        }
    }];
    [postDataTask resume];
}

@end
