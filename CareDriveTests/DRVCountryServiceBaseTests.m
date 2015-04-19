//
//  DRVCountryServiceTests.m
//  CareDrive
//
//  Created by Egor Tolstoy on 19.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

#import "DRVCountryServiceBase.h"
#import "DRVCountryEntity.h"

@interface DRVCountryServiceBaseTests : XCTestCase

@property (strong, nonatomic) DRVCountryServiceBase *countryService;

@end

@implementation DRVCountryServiceBaseTests

- (void)setUp {
    [super setUp];
    
    [MagicalRecord setDefaultModelFromClass:[self class]];
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
    self.countryService = [[DRVCountryServiceBase alloc] init];
}

- (void)tearDown {
    self.countryService = nil;
    [super tearDown];
}

- (void)testThatServiceObtainsCountriesList {
    // given
    XCTestExpectation *expectation = [self expectationWithDescription:@"Handler called"];
    NSInteger const kExpectedCountriesNumber = 5;
    
    NSManagedObjectContext *rootSavingContext = [NSManagedObjectContext MR_rootSavingContext];
    [rootSavingContext performBlockAndWait:^{
        for (NSUInteger i = 0; i < kExpectedCountriesNumber; i++) {
            DRVCountryEntity *country = [DRVCountryEntity MR_createEntity];
            country.name = @"Test name";
            country.isoCode = @"TestCode";
            country.flagColors = @[];
        }
        [rootSavingContext MR_saveOnlySelfAndWait];
    }];
    
    __block NSArray *resultsArray;
    __block NSError *blockError;
    
    // when
    [self.countryService obtainCountriesListWithCompletionBlock:^(NSArray *countries, NSError *error) {
        resultsArray = countries;
        blockError = error;
        [expectation fulfill];
    }];
    
    // then
    [self waitForExpectationsWithTimeout:0.25f handler:^(NSError *error) {
        XCTAssertEqual(resultsArray.count, kExpectedCountriesNumber);
        XCTAssertNil(blockError);
    }];
}


@end
