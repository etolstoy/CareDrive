//
//  DRVCountryPickerPresenter.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerPresenter.h"
#import "DRVCountryModel.h"

#import <UIKit/UIKit.h>
#import <Mapbox-iOS-SDK/Mapbox.h>

static NSString *const DRVTilesFileName = @"caredrive-map";
static NSString *const DRVTilesFileType = @"mbtiles";

@interface DRVCountryPickerPresenter () <UITableViewDataSource>

@property (strong, nonatomic) NSArray *countriesArray;

@end

@implementation DRVCountryPickerPresenter

- (void)setupCountryPickerView {
    [self setupMapWithTiles];
    [self setupCountriesTableView];
}

- (void)setupMapWithTiles {
    [self.view setMapTilesWithName:DRVTilesFileName format:DRVTilesFileType];
}

- (void)setupCountriesTableView {
    [self.interactor obtainCountriesArray];
}

- (void)processTapOnMap:(RMMapView *)map at:(CGPoint)point {
    [map removeAllAnnotations];
    RMMapboxSource *source = map.tileSource;
    
    NSString *formattedOutput = [source formattedOutputOfType:RMInteractiveSourceOutputTypeTeaser forPoint:point inMapView:map];
    NSString *countryCode = [self.interactor countryCodeFromMapFormattedOutput:formattedOutput];
    
    NSArray *polygonsArray = [self.interactor polygonsArrayForCountryCode:countryCode];
    for (NSArray *polygon in polygonsArray) {
        RMPolygonAnnotation *annotation = [[RMPolygonAnnotation alloc] initWithMapView:map points:polygon interiorPolygons:nil];
        [annotation setBoundingBoxFromLocations:polygon];
        [map addAnnotation:annotation];
    }
}

- (void)didObtainCountriesArray:(NSArray *)array {
    self.countriesArray = array;
    [self.view setCountryTableViewDataSource:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.countriesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    DRVCountryModel *country = self.countriesArray[indexPath.row];
    cell.textLabel.text = country.name;
    return cell;
}

@end
