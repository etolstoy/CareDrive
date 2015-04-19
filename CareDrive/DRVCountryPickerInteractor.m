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
#import "DRVCountryEntity.h"
#import "DRVCountryModel.h"

#import <BlocksKit/BlocksKit.h>

@implementation DRVCountryPickerInteractor

- (NSString *)countryCodeFromMapFormattedOutput:(NSString *)formattedOutput {
    return formattedOutput;
}

- (NSArray *)polygonsArrayForCountryCode:(NSString *)countryCode {
    DRVCountryGeoData *geoData = [self.countryGeoService geoDataForCountryWithCountryCode:countryCode];
    return geoData.polygons;
}

- (void)obtainCountriesArray {
    [self.countryService obtainCountriesListWithCompletionBlock:^(NSArray *countries, NSError *error) {
        NSArray *countryModels = [self mapToModelsCountriesEntities:countries];
        [self.presenter didObtainCountriesArray:countryModels];
    }];
}

- (NSArray *)mapToModelsCountriesEntities:(NSArray *)countriesEntities {
    return [countriesEntities bk_map:^id(DRVCountryEntity *obj) {
        DRVCountryModel *model = [DRVCountryModel objectWithName:obj.name countryCode:obj.isoCode flagColors:obj.flagColors];
        return model;
    }];
}

@end
