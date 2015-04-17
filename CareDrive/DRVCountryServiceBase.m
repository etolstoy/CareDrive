//
//  DRVCountryServiceBase.m
//  CareDrive
//
//  Created by Egor Tolstoy on 18.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryServiceBase.h"
#import "DRVCountry.h"

#import <MagicalRecord/CoreData+MagicalRecord.h>

@implementation DRVCountryServiceBase

- (void)obtainCountriesListWithCompletionBlock:(DRVObtainCountriesListCompletionBlock)block {
    NSManagedObjectContext *defaultContext = [NSManagedObjectContext MR_defaultContext];
    NSArray *countriesArray = [DRVCountry MR_findAllInContext:defaultContext];
    
    block(countriesArray, nil);
}

@end
