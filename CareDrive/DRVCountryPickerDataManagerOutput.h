//
//  DRVCountryPickerDataManagerOutput.h
//  CareDrive
//
//  Created by Egor Tolstoy on 18.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DRVCountryPickerDataManagerOutput <NSObject>

- (void)didObtainCountriesArray:(NSArray *)countries;

@end