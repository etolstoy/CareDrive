//
//  DRVCountryGeoService.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryGeoServiceBase.h"
#import "DRVCountryGeoData.h"
#import "DRVGeoJsonConstants.h"

#import <CoreLocation/CoreLocation.h>

static NSString *const geojsonName = @"world-110m";
static NSString *const geojsonType = @"geojson";

@interface DRVCountryGeoServiceBase ()

@property (strong, nonatomic) NSDictionary *countryFeatures;

@end

@implementation DRVCountryGeoServiceBase

- (instancetype)init {
    if (self = [super init]) {
        [self setupCountriesDictionary];
    }
    return self;
}

- (DRVCountryGeoData *)geoDataForCountryWithCountryCode:(NSString *)countryCode {
    NSDictionary *feature = self.countryFeatures[countryCode];
    NSDictionary *geometry = feature[DRVGeoJsonGeometryKey];
    NSString *polygonType = geometry[DRVGeoJsonTypeKey];
    NSMutableArray *polygonsArray = [@[] mutableCopy];
    
    NSDictionary *polygonTypeSelectorsDictionary = [self polygonTypeSelectorsDictionary];
    SEL processingSelector = NSSelectorFromString(polygonTypeSelectorsDictionary[polygonType]);
    polygonsArray = [self performSelector:processingSelector withObject:geometry];
    
    DRVCountryGeoData *geoData = [DRVCountryGeoData countryGeoDataWithCountryCode:countryCode polygons:[polygonsArray copy]];
    return geoData;
}

#pragma mark - Приватные методы

- (NSArray *)processPolygonTypeWithGeometryDictionary:(NSDictionary *)geometryDictionary {
    NSMutableArray *polygonsArray = [@[] mutableCopy];
    
    NSArray *coordinates = [geometryDictionary[DRVGeoJsonCoordinatesKey] firstObject];
    NSArray *polygon = [self locationsArrayForCoordinatesArray:coordinates];
    [polygonsArray addObject:polygon];
    
    return [polygonsArray copy];
}

- (NSArray *)processMultiPolygonTypeWithGeometryDictionary:(NSDictionary *)geometryDictionary {
    NSMutableArray *polygonsArray = [@[] mutableCopy];
    
    NSArray *geometries = geometryDictionary[DRVGeoJsonCoordinatesKey];
    for (NSArray *geometry in geometries) {
        NSArray *coordinates = [geometry firstObject];
        NSArray *polygon = [self locationsArrayForCoordinatesArray:coordinates];
        [polygonsArray addObject:polygon];
    }
    
    return [polygonsArray copy];
}

- (NSArray *)locationsArrayForCoordinatesArray:(NSArray *)coordinatesArray {
    NSMutableArray *locationsMutableArray = [@[] mutableCopy];
    for (NSArray *coordinate in coordinatesArray) {
        CGFloat latitude = [[coordinate lastObject] doubleValue];
        CGFloat longitude = [[coordinate firstObject] doubleValue];
        
        CLLocation *location = [[CLLocation alloc] initWithLatitude:latitude longitude:longitude];
        [locationsMutableArray addObject:location];
    }
    return [locationsMutableArray copy];
}

- (NSDictionary *)polygonTypeSelectorsDictionary {
    return @{
             DRVGeoJsonPolygonTypeKey : NSStringFromSelector(@selector(processPolygonTypeWithGeometryDictionary:)),
             DRVGeoJsonMultiPolygonTypeKey : NSStringFromSelector(@selector(processMultiPolygonTypeWithGeometryDictionary:))
             };
}

- (void)setupCountriesDictionary {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:geojsonName ofType:geojsonType];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:jsonPath] options:0 error:nil];
    
    NSMutableDictionary *mutableCountryFeatures = [@{} mutableCopy];
    NSDictionary *features = json[DRVGeoJsonFeaturesKey];
    for (NSDictionary *feature in features) {
        NSString *countryCode = feature[DRVGeoJsonPropertiesKey][DRVGeoJsonISOA3Key];
        [mutableCountryFeatures setObject:feature forKey:countryCode];
    }
    self.countryFeatures = [mutableCountryFeatures copy];
}

@end
