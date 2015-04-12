//
//  DRVCountryPickerInteractor.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerInteractor.h"

static NSString *const geojsonName = @"world-110m";
static NSString *const geojsonType = @"geojson";

@interface DRVCountryPickerInteractor ()

@property (strong, nonatomic) NSDictionary *countriesGeojson;

@end

@implementation DRVCountryPickerInteractor

- (instancetype)init {
    if (self = [super init]) {
        NSString *jsonPath = [[NSBundle mainBundle] pathForResource:geojsonName ofType:geojsonType];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[[NSData alloc] initWithContentsOfFile:jsonPath]
                                                             options:0
                                                               error:nil];
        NSDictionary *features = json[@"features"];
        
        NSMutableDictionary *mutableCountriesGeojson = [@{} mutableCopy];
        for (NSDictionary *feature in features) {
            NSString *iso = feature[@"properties"][@"iso_a3"];
            [mutableCountriesGeojson setObject:feature[@"geometry"] forKey:iso];
        }
        self.countriesGeojson = [mutableCountriesGeojson copy];
    }
    return self;
}

- (NSString *)countryCodeFromMapFormattedOutput:(NSString *)formattedOutput {
    return nil;
}

- (NSArray *)polygonsArrayForCountryCode:(NSString *)countryCode {
    return nil;
}

@end
