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

@interface DRVCountryPickerPresenterTests : XCTestCase

@property (strong, nonatomic) DRVCountryPickerPresenter *presenter;
@property (strong, nonatomic) id mockView;

@end

@implementation DRVCountryPickerPresenterTests

- (void)setUp {
    [super setUp];

    self.presenter = [[DRVCountryPickerPresenter alloc] init];
    self.mockView = OCMProtocolMock(@protocol(DRVCountryPickerView));
    
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;
    self.mockView = nil;
    
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

@end
