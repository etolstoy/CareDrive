//
//  DRVCountryPickerPresenter.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerPresenter.h"
#import "DRVCountryPickerView.h"

#import <UIKit/UIKit.h>
#import <Mapbox-iOS-SDK/Mapbox.h>

static NSString *const DRVTilesFileName = @"caredrive-map";
static NSString *const DRVTilesFileType = @"mbtiles";

@interface DRVCountryPickerPresenter () <RMMapViewDelegate>

@end

@implementation DRVCountryPickerPresenter

- (void)setupMapWithTiles {
    [self.view setMapTilesWithName:DRVTilesFileName format:DRVTilesFileType];
}

- (id <RMMapViewDelegate>)delegateForMapView {
    return self;
}

#pragma mark - Методы RMMapViewDelegate

- (void)singleTapOnMap:(RMMapView *)map at:(CGPoint)point {
    
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation {
    return nil;
}

@end
