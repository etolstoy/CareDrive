//
//  DRVCountryGeoService.h
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DRVCountryGeoData;

@protocol DRVCountryGeoService <NSObject>

- (DRVCountryGeoData *)geoDataForCountryWithCountryCode:(NSString *)countryCode;

@end
