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

@interface DRVCountryPickerViewController ()

@property (weak, nonatomic) IBOutlet RMMapView *countryMapView;
@property (weak, nonatomic) IBOutlet UITableView *countryTableView;

@end

@implementation DRVCountryPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.presenter = [[DRVCountryPickerPresenter alloc] init];
    self.presenter.view = self;
    [self.presenter setupMapWithTiles];
    
    self.countryMapView.delegate = [self.presenter delegateForMapView];
}

#pragma mark - Методы DRVCountryPickerView

- (void)setMapTilesWithName:(NSString *)mapTilesName format:(NSString *)mapTilesFormat {
    RMMBTilesSource *tilesSource = [[RMMBTilesSource alloc] initWithTileSetResource:mapTilesName ofType:mapTilesFormat];
    [self.countryMapView setTileSource:tilesSource];
}

@end
