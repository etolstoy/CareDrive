//
//  DRVCountryPickerInteractor.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerInteractor.h"
#import "DRVCountryGeoService.h"
#import "DRVCountryService.h"
#import "DRVCountryGeoData.h"

@implementation DRVCountryPickerInteractor

- (NSString *)countryCodeFromMapFormattedOutput:(NSString *)formattedOutput {
    return formattedOutput;
}

- (NSArray *)polygonsArrayForCountryCode:(NSString *)countryCode {
    DRVCountryGeoData *geoData = [self.countryGeoService geoDataForCountryWithCountryCode:countryCode];
    return geoData.polygons;
}

- (void)fetchCountriesArray {
    [self.countryService obtainCountriesListWithCompletionBlock:^(NSArray *countries, NSError *error) {
        [self.presenter didFetchCountriesArray:countries];
    }];
}

@end
