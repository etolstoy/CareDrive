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
#import "DRVCountryService.h"
#import "DRVCountryEntity.h"
#import "DRVCountryModel.h"

@interface DRVTestCountryEntity : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *isoCode;
@property (strong, nonatomic) NSArray *flagColors;
@end

@implementation DRVTestCountryEntity
@end

@interface DRVCountryPickerInteractorTests : XCTestCase

@property (strong, nonatomic) DRVCountryPickerInteractor *interactor;
@property (strong, nonatomic) id mockCountryGeoService;
@property (strong, nonatomic) id mockCountryService;
@property (strong, nonatomic) id mockPresenter;

@end

@implementation DRVCountryPickerInteractorTests

- (void)setUp {
    [super setUp];
    
    self.interactor = [[DRVCountryPickerInteractor alloc] init];
    self.mockCountryGeoService = OCMProtocolMock(@protocol(DRVCountryGeoService));
    self.mockCountryService = OCMProtocolMock(@protocol(DRVCountryService));
    self.mockPresenter = OCMProtocolMock(@protocol(DRVCountryPickerInteractorOutput));
    self.interactor.countryGeoService = self.mockCountryGeoService;
    self.interactor.countryService = self.mockCountryService;
    self.interactor.presenter = self.mockPresenter;
}

- (void)tearDown {
    self.interactor = nil;
    self.mockCountryGeoService = nil;
    self.mockCountryService = nil;
    
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

- (void)testThatInteractorObtainsCountriesArray {
    // given
    DRVTestCountryEntity *countryEntity = [[DRVTestCountryEntity alloc] init];
    countryEntity.name = @"Test Name";
    countryEntity.isoCode = @"TestCode";
    countryEntity.flagColors = @[];
    
    void (^completionProxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
        void (^completionBlock)(NSArray *countries, NSError *error);
        [invocation getArgument:&completionBlock atIndex:2];
        completionBlock(@[countryEntity], nil);
    };
    OCMStub([self.mockCountryService obtainCountriesListWithCompletionBlock:[OCMArg any]]).andDo(completionProxyBlock);

    OCMExpect([self.mockPresenter didObtainCountriesArray:[OCMArg checkWithBlock:^BOOL(NSArray *obj) {
        BOOL checkResult = obj.count == 1 && [[obj firstObject] isKindOfClass:[DRVCountryModel class]];
        return checkResult;
    }]]);
    
    // when
    [self.interactor obtainCountriesArray];
    
    // then
    OCMVerifyAll(self.mockPresenter);
}

@end
