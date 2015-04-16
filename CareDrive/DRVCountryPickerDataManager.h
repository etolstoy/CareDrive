//
//  DRVCountryPickerDataManager.h
//  CareDrive
//
//  Created by Egor Tolstoy on 16.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DRVCountryGeoService;

@interface DRVCountryPickerDataManager : NSObject

@property (strong, nonatomic) id <DRVCountryGeoService> countryGeoService;

@end
