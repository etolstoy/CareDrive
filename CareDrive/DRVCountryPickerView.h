//
//  DRVCountryPickerView.h
//  Протокол для CountryPicker View
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DRVCountryPickerView <NSObject>

- (void)setMapTilesWithName:(NSString *)mapTilesName format:(NSString *)mapTilesFormat;

@end
