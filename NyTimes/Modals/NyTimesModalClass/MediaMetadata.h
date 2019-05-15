//
//  MediaMetadata.h
//
//  Created by Union Coop on 5/15/19
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MediaMetadata : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double height;
@property (nonatomic, assign) double width;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSString *format;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
