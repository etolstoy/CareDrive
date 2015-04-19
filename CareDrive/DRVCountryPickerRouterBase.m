//
//  DRVCountryPickerRouterBase.m
//  CareDrive
//
//  Created by Egor Tolstoy on 19.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryPickerRouterBase.h"
#import "DRVCountryPickerRouterOutput.h"

@implementation DRVCountryPickerRouterBase

- (void)setupCurrentModule {
    [self.presenter setupCountryPickerView];
}

- (void)showCountryInfoView {
    
}

@end
