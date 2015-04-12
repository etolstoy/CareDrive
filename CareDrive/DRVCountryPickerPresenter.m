//
//  DRVCountryPickerPresenter.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerPresenter.h"
#import "DRVCountryPickerView.h"
#import "DRVCountryPickerInteractorIO.h"
#import "DRVCountryPickerInteractor.h"

#import <UIKit/UIKit.h>
#import <Mapbox-iOS-SDK/Mapbox.h>

static NSString *const DRVTilesFileName = @"caredrive-map";
static NSString *const DRVTilesFileType = @"mbtiles";

@interface DRVCountryPickerPresenter () <RMMapViewDelegate>

@end

@implementation DRVCountryPickerPresenter

- (instancetype)init {
    if (self = [super init]) {
        self.interactor = [[DRVCountryPickerInteractor alloc] init];
    }
    return self;
}

- (void)setupMapWithTiles {
    [self.view setMapTilesWithName:DRVTilesFileName format:DRVTilesFileType];
}

- (id <RMMapViewDelegate>)delegateForMapView {
    return self;
}

#pragma mark - Методы RMMapViewDelegate

- (void)singleTapOnMap:(RMMapView *)map at:(CGPoint)point {
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

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation {
    return annotation.layer;
}

@end
