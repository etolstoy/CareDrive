//
//  DRVCountryGeoData.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryGeoData.h"

@interface DRVCountryGeoData ()

@property (strong, nonatomic, readwrite) NSString *countryCode;
@property (strong, nonatomic, readwrite) NSArray *polygons;

@end

@implementation DRVCountryGeoData

- (instancetype)initWithCountryCode:(NSString *)countryCode polygons:(NSArray *)polygons {
    if (self = [super init]) {
        self.countryCode = countryCode;
        self.polygons = polygons;
    }
    return self;
}

+ (instancetype)countryGeoDataWithCountryCode:(NSString *)countryCode polygons:(NSArray *)polygons {
    return [[[self class] alloc] initWithCountryCode:countryCode polygons:polygons];
}

@end
