//
//  BaseClass.m
//
//  Created by Union Coop on 5/15/19
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Results.h"


NSString *const kBaseClassStatus = @"status";
NSString *const kBaseClassResults = @"results";
NSString *const kBaseClassCopyright = @"copyright";
NSString *const kBaseClassNumResults = @"num_results";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize status = _status;
@synthesize results = _results;
@synthesize copyright = _copyright;
@synthesize numResults = _numResults;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.status = [self objectOrNilForKey:kBaseClassStatus fromDictionary:dict];
    NSObject *receivedResults = [dict objectForKey:kBaseClassResults];
    NSMutableArray *parsedResults = [NSMutableArray array];
    
    if ([receivedResults isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedResults) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedResults addObject:[Results modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedResults isKindOfClass:[NSDictionary class]]) {
       [parsedResults addObject:[Results modelObjectWithDictionary:(NSDictionary *)receivedResults]];
    }

    self.results = [NSArray arrayWithArray:parsedResults];
            self.copyright = [self objectOrNilForKey:kBaseClassCopyright fromDictionary:dict];
            self.numResults = [[self objectOrNilForKey:kBaseClassNumResults fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.status forKey:kBaseClassStatus];
    NSMutableArray *tempArrayForResults = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.results) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResults addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResults addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResults] forKey:kBaseClassResults];
    [mutableDict setValue:self.copyright forKey:kBaseClassCopyright];
    [mutableDict setValue:[NSNumber numberWithDouble:self.numResults] forKey:kBaseClassNumResults];

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

    self.status = [aDecoder decodeObjectForKey:kBaseClassStatus];
    self.results = [aDecoder decodeObjectForKey:kBaseClassResults];
    self.copyright = [aDecoder decodeObjectForKey:kBaseClassCopyright];
    self.numResults = [aDecoder decodeDoubleForKey:kBaseClassNumResults];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_status forKey:kBaseClassStatus];
    [aCoder encodeObject:_results forKey:kBaseClassResults];
    [aCoder encodeObject:_copyright forKey:kBaseClassCopyright];
    [aCoder encodeDouble:_numResults forKey:kBaseClassNumResults];
}

- (id)copyWithZone:(NSZone *)zone {
    BaseClass *copy = [[BaseClass alloc] init];
    
    
    
    if (copy) {

        copy.status = [self.status copyWithZone:zone];
        copy.results = [self.results copyWithZone:zone];
        copy.copyright = [self.copyright copyWithZone:zone];
        copy.numResults = self.numResults;
    }
    
    return copy;
}


@end
