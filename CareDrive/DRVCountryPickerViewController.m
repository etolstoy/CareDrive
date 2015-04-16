//
//  DRVCountryPickerViewController.m
//  CareDrive
//
//  Created by Egor Tolstoy on 06.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerViewController.h"
#import "DRVCountryPickerPresenter.h"

#import <MapKit/MapKit.h>
#import <Mapbox-iOS-SDK/Mapbox.h>

@interface DRVCountryPickerViewController () <RMMapViewDelegate>

@property (weak, nonatomic) IBOutlet RMMapView *countryMapView;
@property (weak, nonatomic) IBOutlet UITableView *countryTableView;

@end

@implementation DRVCountryPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.presenter setupMapWithTiles];
    
    self.countryMapView.delegate = self;
}

#pragma mark - Методы DRVCountryPickerView

- (void)setMapTilesWithName:(NSString *)mapTilesName format:(NSString *)mapTilesFormat {
    RMMBTilesSource *tilesSource = [[RMMBTilesSource alloc] initWithTileSetResource:mapTilesName ofType:mapTilesFormat];
    [self.countryMapView setTileSource:tilesSource];
}

#pragma mark - Методы RMMapViewDelegate

- (void)singleTapOnMap:(RMMapView *)map at:(CGPoint)point {
    [self.presenter processTapOnMap:map at:point];
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation {
    return annotation.layer;
}

@end
