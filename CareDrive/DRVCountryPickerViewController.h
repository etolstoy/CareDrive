//
//  DRVCountryPickerViewController.h
//  CareDrive
//
//  Created by Egor Tolstoy on 06.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DRVCountryPickerViewIO.h"

@class DRVCountryPickerPresenter;

@interface DRVCountryPickerViewController : UIViewController <DRVCountryPickerViewInput>

@property (strong, nonatomic) id <DRVCountryPickerViewOutput> presenter;

@end
