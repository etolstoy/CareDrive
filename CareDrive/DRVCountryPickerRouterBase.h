//
//  DRVCountryPickerRouterBase.h
//  CareDrive
//
//  Created by Egor Tolstoy on 19.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVRouterBase.h"
#import "DRVCountryPickerRouter.h"

@protocol DRVCountryPickerRouterOutput;

@interface DRVCountryPickerRouterBase : DRVRouterBase <DRVCountryPickerRouter>

@property (strong, nonatomic) id <DRVCountryPickerRouterOutput> presenter;

@end
