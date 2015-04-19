//
//  DRVCountryPickerPresenter.h
//  CareDrive
//
//  Created by Egor Tolstoy on 12.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DRVCountryPickerInteractorIO.h"
#import "DRVCountryPickerViewIO.h"
#import "DRVCountryPickerRouter.h"
#import "DRVCountryPickerRouterOutput.h"

@interface DRVCountryPickerPresenter : NSObject <DRVCountryPickerInteractorOutput, DRVCountryPickerViewOutput, DRVCountryPickerRouterOutput>

@property (nonatomic, strong) id <DRVCountryPickerViewInput> view;
@property (nonatomic, strong) id <DRVCountryPickerRouter> router;
@property (nonatomic, strong) id <DRVCountryPickerInteractorInput> interactor;

@end
