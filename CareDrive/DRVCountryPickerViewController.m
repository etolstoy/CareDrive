//
//  DRVCountryPickerViewController.m
//  CareDrive
//
//  Created by Egor Tolstoy on 06.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerViewController.h"

#import <MapKit/MapKit.h>
#import <Mapbox-iOS-SDK/Mapbox.h>

static NSString *const DRVTilesFileName = @"caredrive-map";
static NSString *const DRVTilesFileType = @"mbtiles";

@interface DRVCountryPickerViewController ()

@property (weak, nonatomic) IBOutlet RMMapView *countryMapView;
@property (weak, nonatomic) IBOutlet UITableView *countryTableView;

@end

@implementation DRVCountryPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RMMBTilesSource *tilesSource = [[RMMBTilesSource alloc] initWithTileSetResource:DRVTilesFileName ofType:DRVTilesFileType];
    [self.countryMapView setTileSource:tilesSource];
}

@end
