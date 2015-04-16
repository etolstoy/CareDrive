//
//  DRVCountryPickerDataManager.m
//  CareDrive
//
//  Created by Egor Tolstoy on 16.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerDataManager.h"
#import "DRVCountryGeoService.h"
#import "DRVCountryGeoData.h"

@implementation DRVCountryPickerDataManager

- (NSArray *)obtainPolygonsArrayForCountryCode:(NSString *)countryCode {
    DRVCountryGeoData *geoData = [self.countryGeoService geoDataForCountryWithCountryCode:countryCode];
    return geoData.polygons;
}

@end
