//
//  Media.m
//
//  Created by Union Coop on 5/15/19
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "Media.h"
#import "MediaMetadata.h"


NSString *const kMediaSubtype = @"subtype";
NSString *const kMediaCopyright = @"copyright";
NSString *const kMediaMediaMetadata = @"media-metadata";
NSString *const kMediaCaption = @"caption";
NSString *const kMediaType = @"type";
NSString *const kMediaApprovedForSyndication = @"approved_for_syndication";


@interface Media ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Media

@synthesize subtype = _subtype;
@synthesize copyright = _copyright;
@synthesize mediaMetadata = _mediaMetadata;
@synthesize caption = _caption;
@synthesize type = _type;
@synthesize approvedForSyndication = _approvedForSyndication;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.subtype = [self objectOrNilForKey:kMediaSubtype fromDictionary:dict];
            self.copyright = [self objectOrNilForKey:kMediaCopyright fromDictionary:dict];
    NSObject *receivedMediaMetadata = [dict objectForKey:kMediaMediaMetadata];
    NSMutableArray *parsedMediaMetadata = [NSMutableArray array];
    
    if ([receivedMediaMetadata isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMediaMetadata) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMediaMetadata addObject:[MediaMetadata modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMediaMetadata isKindOfClass:[NSDictionary class]]) {
       [parsedMediaMetadata addObject:[MediaMetadata modelObjectWithDictionary:(NSDictionary *)receivedMediaMetadata]];
    }

    self.mediaMetadata = [NSArray arrayWithArray:parsedMediaMetadata];
            self.caption = [self objectOrNilForKey:kMediaCaption fromDictionary:dict];
            self.type = [self objectOrNilForKey:kMediaType fromDictionary:dict];
            self.approvedForSyndication = [[self objectOrNilForKey:kMediaApprovedForSyndication fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subtype forKey:kMediaSubtype];
    [mutableDict setValue:self.copyright forKey:kMediaCopyright];
    NSMutableArray *tempArrayForMediaMetadata = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.mediaMetadata) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMediaMetadata addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMediaMetadata addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMediaMetadata] forKey:kMediaMediaMetadata];
    [mutableDict setValue:self.caption forKey:kMediaCaption];
    [mutableDict setValue:self.type forKey:kMediaType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.approvedForSyndication] forKey:kMediaApprovedForSyndication];

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

    self.subtype = [aDecoder decodeObjectForKey:kMediaSubtype];
    self.copyright = [aDecoder decodeObjectForKey:kMediaCopyright];
    self.mediaMetadata = [aDecoder decodeObjectForKey:kMediaMediaMetadata];
    self.caption = [aDecoder decodeObjectForKey:kMediaCaption];
    self.type = [aDecoder decodeObjectForKey:kMediaType];
    self.approvedForSyndication = [aDecoder decodeDoubleForKey:kMediaApprovedForSyndication];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subtype forKey:kMediaSubtype];
    [aCoder encodeObject:_copyright forKey:kMediaCopyright];
    [aCoder encodeObject:_mediaMetadata forKey:kMediaMediaMetadata];
    [aCoder encodeObject:_caption forKey:kMediaCaption];
    [aCoder encodeObject:_type forKey:kMediaType];
    [aCoder encodeDouble:_approvedForSyndication forKey:kMediaApprovedForSyndication];
}

- (id)copyWithZone:(NSZone *)zone {
    Media *copy = [[Media alloc] init];
    
    
    
    if (copy) {

        copy.subtype = [self.subtype copyWithZone:zone];
        copy.copyright = [self.copyright copyWithZone:zone];
        copy.mediaMetadata = [self.mediaMetadata copyWithZone:zone];
        copy.caption = [self.caption copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.approvedForSyndication = self.approvedForSyndication;
    }
    
    return copy;
}


@end
