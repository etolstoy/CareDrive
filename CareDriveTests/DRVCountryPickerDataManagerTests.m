//
//  DRVCountryPickerDataManagerTests.m
//  CareDrive
//
//  Created by Egor Tolstoy on 16.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "DRVCountryPickerDataManager.h"
#import "DRVCountryGeoService.h"

@interface DRVCountryPickerDataManagerTests : XCTestCase

@property (strong, nonatomic) DRVCountryPickerDataManager *dataManager;
@property (strong, nonatomic) id mockCountryGeoService;

@end

@implementation DRVCountryPickerDataManagerTests

- (void)setUp {
    [super setUp];
    
    self.dataManager = [[DRVCountryPickerDataManager alloc] init];
    self.mockCountryGeoService = OCMProtocolMock(@protocol(DRVCountryGeoService));
    
    self.dataManager.countryGeoService = self.mockCountryGeoService;
}

- (void)tearDown {
    self.dataManager = nil;
    
    [super tearDown];
}

- (void)testThatDataManagerObtainsPolygonsArray {
    // given
    NSString *const kCountryCode = @"RUS";
    
    OCMExpect([self.mockCountryGeoService geoDataForCountryWithCountryCode:kCountryCode]);
    
    // when
    [self.dataManager obtainPolygonsArrayForCountryCode:kCountryCode];
    
    // then
    OCMVerifyAll(self.mockCountryGeoService);
}

@end
