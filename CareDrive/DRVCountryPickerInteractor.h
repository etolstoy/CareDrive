//
//  DRVCountryPickerInteractor.h
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DRVCountryPickerInteractorIO.h"

@class DRVCountryPickerDataManager;

@protocol DRVCountryGeoService;
@protocol DRVCountryService;

@interface DRVCountryPickerInteractor : NSObject <DRVCountryPickerInteractorInput>

@property (strong, nonatomic) id <DRVCountryPickerInteractorOutput> presenter;
@property (strong, nonatomic) id <DRVCountryGeoService> countryGeoService;
@property (strong, nonatomic) id <DRVCountryService> countryService;

@end
