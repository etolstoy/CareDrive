//
//  DRVCountryPickerDataManager.h
//  CareDrive
//
//  Created by Egor Tolstoy on 16.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DRVCountryGeoService;
@protocol DRVCountryService;
@protocol DRVCountryPickerDataManagerOutput;

@interface DRVCountryPickerDataManager : NSObject

@property (strong, nonatomic) id <DRVCountryGeoService> countryGeoService;
@property (strong, nonatomic) id <DRVCountryService> countryService;
@property (strong, nonatomic) id <DRVCountryPickerDataManagerOutput> interactor;

- (NSArray *)obtainPolygonsArrayForCountryCode:(NSString *)countryCode;
- (void)obtainCountriesArray;

@end