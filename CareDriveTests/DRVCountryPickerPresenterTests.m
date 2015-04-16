//
//  DRVCountryPickerPresenterTests.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "DRVCountryPickerPresenter.h"
#import "DRVCountryPickerView.h"
#import "DRVCountryPickerInteractorIO.h"

@protocol RMMapViewDelegate;

@interface DRVCountryPickerPresenterTests : XCTestCase

@property (strong, nonatomic) DRVCountryPickerPresenter *presenter;
@property (strong, nonatomic) id mockView;
@property (strong, nonatomic) id mockInteractor;

@end

@implementation DRVCountryPickerPresenterTests

- (void)setUp {
    [super setUp];

    self.presenter = [[DRVCountryPickerPresenter alloc] init];
    self.mockView = OCMProtocolMock(@protocol(DRVCountryPickerView));
    self.mockInteractor = OCMProtocolMock(@protocol(DRVCountryPickerInteractorInput));
    
    self.presenter.view = self.mockView;
    self.presenter.interactor = self.mockInteractor;
}

- (void)tearDown {
    self.presenter = nil;
    self.mockView = nil;
    self.mockInteractor = nil;
    
    [super tearDown];
}

- (void)testThatPresenterSetsMapTiles {
    // given
    OCMExpect([self.mockView setMapTilesWithName:[OCMArg isNotNil] format:[OCMArg isNotNil]]);
    
    // when
    [self.presenter setupMapWithTiles];
    
    // then
    OCMVerifyAll(self.mockView);
}

- (void)testThatPresenterProcessesTapOnMap {
    // given
    OCMExpect([self.mockInteractor countryCodeFromMapFormattedOutput:[OCMArg any]]);
    OCMExpect([self.mockInteractor polygonsArrayForCountryCode:[OCMArg any]]);
    
    // when
    [self.presenter processTapOnMap:nil at:CGPointZero];
    
    // then
    OCMVerifyAll(self.mockView);
}

@end
