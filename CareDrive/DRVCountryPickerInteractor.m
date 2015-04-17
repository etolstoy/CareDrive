//
//  DRVCountryPickerInteractor.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerInteractor.h"
#import "DRVCountryPickerDataManager.h"

@implementation DRVCountryPickerInteractor

- (NSString *)countryCodeFromMapFormattedOutput:(NSString *)formattedOutput {
    return formattedOutput;
}

- (NSArray *)polygonsArrayForCountryCode:(NSString *)countryCode {
    return [self.dataManager obtainPolygonsArrayForCountryCode:countryCode];
}

- (void)fetchCountriesArray {
    [self.dataManager obtainCountriesArray];
}

- (void)didObtainCountriesArray:(NSArray *)countries {
    [self.presenter didFetchCountriesArray:countries];
}

@end
