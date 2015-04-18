//
//  DRVCountryPickerInteractorTests.m
//  CareDrive
//
//  Created by Egor Tolstoy on 16.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "DRVCountryPickerInteractor.h"
#import "DRVCountryGeoService.h"

@interface DRVCountryPickerInteractorTests : XCTestCase

@property (strong, nonatomic) DRVCountryPickerInteractor *interactor;
@property (strong, nonatomic) id mockCountryGeoService;

@end

@implementation DRVCountryPickerInteractorTests

- (void)setUp {
    [super setUp];
    
    self.interactor = [[DRVCountryPickerInteractor alloc] init];
    self.mockCountryGeoService = OCMProtocolMock(@protocol(DRVCountryGeoService));
    self.interactor.countryGeoService = self.mockCountryGeoService;
}

- (void)tearDown {
    self.interactor = nil;
    self.mockCountryGeoService = nil;
    
    [super tearDown];
}

- (void)testThatInteractorReturnsCountryCodeFromFormattedOutput {
    // given
    NSString *const kFormattedOutput = @"RUS";
    NSString *const kExpectedCountryCode = @"RUS";
    
    // when
    NSString *countryCode = [self.interactor countryCodeFromMapFormattedOutput:kFormattedOutput];
    
    // then
    XCTAssertEqualObjects(countryCode, kExpectedCountryCode);
}

- (void)testThatInteractorReturnsPolygonsArrayForCountryCode {
    // given
    NSString *const kCountryCode = @"RUS";
    OCMExpect([self.mockCountryGeoService geoDataForCountryWithCountryCode:kCountryCode]);
    
    // when
    [self.interactor polygonsArrayForCountryCode:kCountryCode];
    
    // then
    OCMVerifyAll(self.mockCountryGeoService);
}

@end
