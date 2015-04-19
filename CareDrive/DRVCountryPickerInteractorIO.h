//
//  DRVCountryPickerInteractorIO.h
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DRVCountryPickerInteractorInput <NSObject>

- (NSString *)countryCodeFromMapFormattedOutput:(NSString *)formattedOutput;
- (NSArray *)polygonsArrayForCountryCode:(NSString *)countryCode;
- (void)obtainCountriesArray;

@end

@protocol DRVCountryPickerInteractorOutput <NSObject>

- (void)didObtainCountriesArray:(NSArray *)array;

@end