//
//  DRVCountryPickerPresenter.h
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DRVCountryPickerInteractorIO.h"

@protocol DRVCountryPickerView;
@protocol DRVCountryPickerInteractorInput;

@class RMMapView;

@interface DRVCountryPickerPresenter : NSObject <DRVCountryPickerInteractorOutput>

@property (nonatomic, strong) id <DRVCountryPickerView> view;
@property (nonatomic, strong) id <DRVCountryPickerInteractorInput> interactor;

- (void)setupMapWithTiles;
- (void)setupCountriesTableView;
- (void)processTapOnMap:(RMMapView *)map at:(CGPoint)point;

@end
