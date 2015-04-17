//
//  DRVCountryService.h
//  CareDrive
//
//  Created by Egor Tolstoy on 17.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DRVObtainCountriesListCompletionBlock)(NSArray *countries, NSError *error);

@protocol DRVCountryService <NSObject>

- (void)obtainCountriesListWithCompletionBlock:(DRVObtainCountriesListCompletionBlock)block;

@end
