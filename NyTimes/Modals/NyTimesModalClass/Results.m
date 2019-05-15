//
//  Results.m
//
//  Created by Union Coop on 5/15/19
//  Copyright (c) 2019 __MyCompanyName__. All rights reserved.
//

#import "Results.h"
#import "Media.h"


NSString *const kResultsId = @"id";
NSString *const kResultsSection = @"section";
NSString *const kResultsAdxKeywords = @"adx_keywords";
NSString *const kResultsColumn = @"column";
NSString *const kResultsAssetId = @"asset_id";
NSString *const kResultsDesFacet = @"des_facet";
NSString *const kResultsByline = @"byline";
NSString *const kResultsAbstract = @"abstract";
NSString *const kResultsOrgFacet = @"org_facet";
NSString *const kResultsUrl = @"url";
NSString *const kResultsType = @"type";
NSString *const kResultsTitle = @"title";
NSString *const kResultsSource = @"source";
NSString *const kResultsGeoFacet = @"geo_facet";
NSString *const kResultsPublishedDate = @"published_date";
NSString *const kResultsPerFacet = @"per_facet";
NSString *const kResultsMedia = @"media";
NSString *const kResultsViews = @"views";


@interface Results ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Results

@synthesize resultsIdentifier = _resultsIdentifier;
@synthesize section = _section;
@synthesize adxKeywords = _adxKeywords;
@synthesize column = _column;
@synthesize assetId = _assetId;
@synthesize desFacet = _desFacet;
@synthesize byline = _byline;
@synthesize abstract = _abstract;
@synthesize orgFacet = _orgFacet;
@synthesize url = _url;
@synthesize type = _type;
@synthesize title = _title;
@synthesize source = _source;
@synthesize geoFacet = _geoFacet;
@synthesize publishedDate = _publishedDate;
@synthesize perFacet = _perFacet;
@synthesize media = _media;
@synthesize views = _views;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict {
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if (self && [dict isKindOfClass:[NSDictionary class]]) {
            self.resultsIdentifier = [[self objectOrNilForKey:kResultsId fromDictionary:dict] doubleValue];
            self.section = [self objectOrNilForKey:kResultsSection fromDictionary:dict];
            self.adxKeywords = [self objectOrNilForKey:kResultsAdxKeywords fromDictionary:dict];
            self.column = [self objectOrNilForKey:kResultsColumn fromDictionary:dict];
            self.assetId = [[self objectOrNilForKey:kResultsAssetId fromDictionary:dict] doubleValue];
            self.desFacet = [self objectOrNilForKey:kResultsDesFacet fromDictionary:dict];
            self.byline = [self objectOrNilForKey:kResultsByline fromDictionary:dict];
            self.abstract = [self objectOrNilForKey:kResultsAbstract fromDictionary:dict];
            self.orgFacet = [self objectOrNilForKey:kResultsOrgFacet fromDictionary:dict];
            self.url = [self objectOrNilForKey:kResultsUrl fromDictionary:dict];
            self.type = [self objectOrNilForKey:kResultsType fromDictionary:dict];
            self.title = [self objectOrNilForKey:kResultsTitle fromDictionary:dict];
            self.source = [self objectOrNilForKey:kResultsSource fromDictionary:dict];
            self.geoFacet = [self objectOrNilForKey:kResultsGeoFacet fromDictionary:dict];
            self.publishedDate = [self objectOrNilForKey:kResultsPublishedDate fromDictionary:dict];
            self.perFacet = [self objectOrNilForKey:kResultsPerFacet fromDictionary:dict];
    NSObject *receivedMedia = [dict objectForKey:kResultsMedia];
    NSMutableArray *parsedMedia = [NSMutableArray array];
    
    if ([receivedMedia isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMedia) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMedia addObject:[Media modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMedia isKindOfClass:[NSDictionary class]]) {
       [parsedMedia addObject:[Media modelObjectWithDictionary:(NSDictionary *)receivedMedia]];
    }

    self.media = [NSArray arrayWithArray:parsedMedia];
            self.views = [[self objectOrNilForKey:kResultsViews fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation {
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultsIdentifier] forKey:kResultsId];
    [mutableDict setValue:self.section forKey:kResultsSection];
    [mutableDict setValue:self.adxKeywords forKey:kResultsAdxKeywords];
    [mutableDict setValue:self.column forKey:kResultsColumn];
    [mutableDict setValue:[NSNumber numberWithDouble:self.assetId] forKey:kResultsAssetId];
    NSMutableArray *tempArrayForDesFacet = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.desFacet) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDesFacet addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDesFacet addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDesFacet] forKey:kResultsDesFacet];
    [mutableDict setValue:self.byline forKey:kResultsByline];
    [mutableDict setValue:self.abstract forKey:kResultsAbstract];
    NSMutableArray *tempArrayForOrgFacet = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.orgFacet) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForOrgFacet addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForOrgFacet addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForOrgFacet] forKey:kResultsOrgFacet];
    [mutableDict setValue:self.url forKey:kResultsUrl];
    [mutableDict setValue:self.type forKey:kResultsType];
    [mutableDict setValue:self.title forKey:kResultsTitle];
    [mutableDict setValue:self.source forKey:kResultsSource];
    [mutableDict setValue:self.geoFacet forKey:kResultsGeoFacet];
    [mutableDict setValue:self.publishedDate forKey:kResultsPublishedDate];
    NSMutableArray *tempArrayForPerFacet = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.perFacet) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPerFacet addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPerFacet addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPerFacet] forKey:kResultsPerFacet];
    NSMutableArray *tempArrayForMedia = [NSMutableArray array];
    
    for (NSObject *subArrayObject in self.media) {
        if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMedia addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMedia addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMedia] forKey:kResultsMedia];
    [mutableDict setValue:[NSNumber numberWithDouble:self.views] forKey:kResultsViews];

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

    self.resultsIdentifier = [aDecoder decodeDoubleForKey:kResultsId];
    self.section = [aDecoder decodeObjectForKey:kResultsSection];
    self.adxKeywords = [aDecoder decodeObjectForKey:kResultsAdxKeywords];
    self.column = [aDecoder decodeObjectForKey:kResultsColumn];
    self.assetId = [aDecoder decodeDoubleForKey:kResultsAssetId];
    self.desFacet = [aDecoder decodeObjectForKey:kResultsDesFacet];
    self.byline = [aDecoder decodeObjectForKey:kResultsByline];
    self.abstract = [aDecoder decodeObjectForKey:kResultsAbstract];
    self.orgFacet = [aDecoder decodeObjectForKey:kResultsOrgFacet];
    self.url = [aDecoder decodeObjectForKey:kResultsUrl];
    self.type = [aDecoder decodeObjectForKey:kResultsType];
    self.title = [aDecoder decodeObjectForKey:kResultsTitle];
    self.source = [aDecoder decodeObjectForKey:kResultsSource];
    self.geoFacet = [aDecoder decodeObjectForKey:kResultsGeoFacet];
    self.publishedDate = [aDecoder decodeObjectForKey:kResultsPublishedDate];
    self.perFacet = [aDecoder decodeObjectForKey:kResultsPerFacet];
    self.media = [aDecoder decodeObjectForKey:kResultsMedia];
    self.views = [aDecoder decodeDoubleForKey:kResultsViews];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_resultsIdentifier forKey:kResultsId];
    [aCoder encodeObject:_section forKey:kResultsSection];
    [aCoder encodeObject:_adxKeywords forKey:kResultsAdxKeywords];
    [aCoder encodeObject:_column forKey:kResultsColumn];
    [aCoder encodeDouble:_assetId forKey:kResultsAssetId];
    [aCoder encodeObject:_desFacet forKey:kResultsDesFacet];
    [aCoder encodeObject:_byline forKey:kResultsByline];
    [aCoder encodeObject:_abstract forKey:kResultsAbstract];
    [aCoder encodeObject:_orgFacet forKey:kResultsOrgFacet];
    [aCoder encodeObject:_url forKey:kResultsUrl];
    [aCoder encodeObject:_type forKey:kResultsType];
    [aCoder encodeObject:_title forKey:kResultsTitle];
    [aCoder encodeObject:_source forKey:kResultsSource];
    [aCoder encodeObject:_geoFacet forKey:kResultsGeoFacet];
    [aCoder encodeObject:_publishedDate forKey:kResultsPublishedDate];
    [aCoder encodeObject:_perFacet forKey:kResultsPerFacet];
    [aCoder encodeObject:_media forKey:kResultsMedia];
    [aCoder encodeDouble:_views forKey:kResultsViews];
}

- (id)copyWithZone:(NSZone *)zone {
    Results *copy = [[Results alloc] init];
    
    
    
    if (copy) {

        copy.resultsIdentifier = self.resultsIdentifier;
        copy.section = [self.section copyWithZone:zone];
        copy.adxKeywords = [self.adxKeywords copyWithZone:zone];
        copy.column = [self.column copyWithZone:zone];
        copy.assetId = self.assetId;
        copy.desFacet = [self.desFacet copyWithZone:zone];
        copy.byline = [self.byline copyWithZone:zone];
        copy.abstract = [self.abstract copyWithZone:zone];
        copy.orgFacet = [self.orgFacet copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.geoFacet = [self.geoFacet copyWithZone:zone];
        copy.publishedDate = [self.publishedDate copyWithZone:zone];
        copy.perFacet = [self.perFacet copyWithZone:zone];
        copy.media = [self.media copyWithZone:zone];
        copy.views = self.views;
    }
    
    return copy;
}


@end
