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
#import "DRVCountry.h"
#import "DRVCountryModel.h"

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
        NSArray *countryModels = [self mapToModelsCountriesEntities:countries];
        [self.presenter didFetchCountriesArray:countryModels];
    }];
}

- (NSArray *)mapToModelsCountriesEntities:(NSArray *)countriesEntities {
    NSMutableArray *results = [@[] mutableCopy];
    for (DRVCountry *country in countriesEntities) {
        DRVCountryModel *model = [DRVCountryModel objectWithName:country.name countryCode:country.isoCode flagColors:country.flagColors];
        [results addObject:model];
    }
    return [results copy];
}

@end
