//
//  DRVCountryPickerView.h
//  Протокол для CountryPicker View
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RMMapView;

@protocol DRVCountryPickerViewInput <NSObject>

- (void)setMapTilesWithName:(NSString *)mapTilesName format:(NSString *)mapTilesFormat;
- (void)setCountryTableViewDataSource:(id <UITableViewDataSource>)dataSource;

@end

@protocol DRVCountryPickerViewOutput <NSObject>

- (void)setupMapWithTiles;
- (void)setupCountriesTableView;
- (void)processTapOnMap:(RMMapView *)map at:(CGPoint)point;

@end