//
//  DRVCountryPickerDataManager.m
//  CareDrive
//
//  Created by Egor Tolstoy on 16.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerDataManager.h"
#import "DRVCountryGeoService.h"
#import "DRVCountryService.h"
#import "DRVCountryGeoData.h"
#import "DRVCountryPickerDataManagerOutput.h"

@implementation DRVCountryPickerDataManager

- (NSArray *)obtainPolygonsArrayForCountryCode:(NSString *)countryCode {
    DRVCountryGeoData *geoData = [self.countryGeoService geoDataForCountryWithCountryCode:countryCode];
    return geoData.polygons;
}

- (void)obtainCountriesArray {
    [self.countryService obtainCountriesListWithCompletionBlock:^(NSArray *countries, NSError *error) {
        [self.interactor didObtainCountriesArray:countries];
    }];
}

@end
