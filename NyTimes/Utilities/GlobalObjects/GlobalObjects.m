//
//  GlobalObjects.m
//  NyTimes
//
//  Created by Nytimes on 5/15/19.
//

#import "GlobalObjects.h"

static NSString *baseURL_General                        = @"https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/";
static NSString *apiKey                                 = @"bvAUhQbYkrnw0GrsjjXRKS0eLwFZzmOA";


@implementation GlobalObjects

+(NSString*)getBaseURLGeneral{
    return baseURL_General;
}
+(NSString*)getAPIKey{
    return apiKey;
}


@end
