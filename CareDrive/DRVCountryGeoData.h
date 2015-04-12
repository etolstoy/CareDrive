//
//  DRVCountryGeoData.h
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRVCountryGeoData : NSObject

+ (instancetype)countryGeoDataWithCountryCode:(NSString *)countryCode polygons:(NSArray *)polygons;

@property (strong, nonatomic, readonly) NSString *countryCode;
@property (strong, nonatomic, readonly) NSArray *polygons;

@end
