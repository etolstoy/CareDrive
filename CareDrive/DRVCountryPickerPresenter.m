//
//  DRVCountryPickerPresenter.m
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerPresenter.h"
#import "DRVCountryPickerView.h"

static NSString *const DRVTilesFileName = @"caredrive-map";
static NSString *const DRVTilesFileType = @"mbtiles";

@implementation DRVCountryPickerPresenter

- (void)setupMapWithTiles {
    [self.view setMapTilesWithName:DRVTilesFileName format:DRVTilesFileType];
}

@end
