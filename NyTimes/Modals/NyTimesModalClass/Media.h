//
//  Media.h
//
//  Created by Union Coop on 5/15/19
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Media : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *subtype;
@property (nonatomic, strong) NSString *copyright;
@property (nonatomic, strong) NSArray *mediaMetadata;
@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, assign) double approvedForSyndication;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
