//
//  MediaMetadata.m
//
//  Created by Union Coop on 5/15/19
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "MediaMetadata.h"


NSString *const kMediaMetadataHeight = @"height";
NSString *const kMediaMetadataWidth = @"width";
NSString *const kMediaMetadataUrl = @"url";
NSString *const kMediaMetadataFormat = @"format";


@interface MediaMetadata ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MediaMetadata

@synthesize height = _height;
@synthesize width = _width;
@synthesize urlString = _urlString;
@synthesize format = _format;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.height = [[self objectOrNilForKey:kMediaMetadataHeight fromDictionary:dict] doubleValue];
            self.width = [[self objectOrNilForKey:kMediaMetadataWidth fromDictionary:dict] doubleValue];
            self.urlString = [self objectOrNilForKey:kMediaMetadataUrl fromDictionary:dict];
            self.format = [self objectOrNilForKey:kMediaMetadataFormat fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kMediaMetadataHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kMediaMetadataWidth];
    [mutableDict setValue:self.urlString forKey:kMediaMetadataUrl];
    [mutableDict setValue:self.format forKey:kMediaMetadataFormat];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description  {
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict {
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];

    self.height = [aDecoder decodeDoubleForKey:kMediaMetadataHeight];
    self.width = [aDecoder decodeDoubleForKey:kMediaMetadataWidth];
    self.urlString = [aDecoder decodeObjectForKey:kMediaMetadataUrl];
    self.format = [aDecoder decodeObjectForKey:kMediaMetadataFormat];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_height forKey:kMediaMetadataHeight];
    [aCoder encodeDouble:_width forKey:kMediaMetadataWidth];
    [aCoder encodeObject:_urlString forKey:kMediaMetadataUrl];
    [aCoder encodeObject:_format forKey:kMediaMetadataFormat];
}

- (id)copyWithZone:(NSZone *)zone {
    MediaMetadata *copy = [[MediaMetadata alloc] init];
    
    
    
    if (copy) {

        copy.height = self.height;
        copy.width = self.width;
        copy.urlString = [self.urlString copyWithZone:zone];
        copy.format = [self.format copyWithZone:zone];
    }
    
    return copy;
}


@end
