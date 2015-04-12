//
//  DRVCountryGeoService.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryGeoServiceBase.h"
#import "DRVCountryGeoData.h"

#import <CoreLocation/CoreLocation.h>

@implementation DRVCountryGeoServiceBase

- (DRVCountryGeoData *)geoDataForCountryWithCountryCode:(NSString *)countryCode {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"world-110m" ofType:@"geojson"];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:jsonPath] options:0 error:nil];
    NSDictionary *features = json[@"features"];
    for (NSDictionary *feature in features) {
        NSString *iso = feature[@"properties"][@"iso_a3"];
        if ([iso isEqualToString:countryCode]) {
            NSDictionary *geometry = feature[@"geometry"];
            NSString *polygonType = geometry[@"type"];
            NSMutableArray *polygonsArray = [@[] mutableCopy];
            
            if ([polygonType isEqualToString:@"Polygon"]) {
                NSMutableArray *locationsArray = [@[] mutableCopy];
                NSArray *coordinates = [geometry[@"coordinates"] firstObject];
                for (NSArray *coordinate in coordinates) {
                    CLLocation *location = [[CLLocation alloc] initWithLatitude:[[coordinate lastObject] doubleValue] longitude:[[coordinate firstObject] doubleValue]];
                    [locationsArray addObject:location];
                }
                [polygonsArray addObject:[locationsArray copy]];
            } else if ([polygonType isEqualToString:@"MultiPolygon"]) {
                NSArray *polygons = geometry[@"coordinates"];
                for (NSArray *polygon in polygons) {
                    NSMutableArray *locationsArray = [@[] mutableCopy];
                    NSArray *coordinates = [polygon firstObject];
                    for (NSArray *coordinate in coordinates) {
                        CLLocation *location = [[CLLocation alloc] initWithLatitude:[[coordinate lastObject] doubleValue] longitude:[[coordinate firstObject] doubleValue]];
                        [locationsArray addObject:location];
                    }
                    [polygonsArray addObject:[locationsArray copy]];
                }
            }
            
            DRVCountryGeoData *geoData = [DRVCountryGeoData countryGeoDataWithCountryCode:countryCode polygons:[polygonsArray copy]];
            return geoData;
        }
    }

    return nil;
}

@end
