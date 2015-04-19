//
//  DRVModuleAssembly.m
//  CareDrive
//
//  Created by Egor Tolstoy on 16.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVModuleAssembly.h"

#import "DRVCountryPickerViewIO.h"
#import "DRVCountryPickerInteractorIO.h"
#import "DRVCountryPickerViewController.h"
#import "DRVCountryPickerPresenter.h"
#import "DRVCountryPickerInteractor.h"
#import "DRVCountryGeoServiceBase.h"
#import "DRVCountryServiceBase.h"

@implementation DRVModuleAssembly

- (id <DRVCountryPickerViewInput>)countryPickerViewController {
    return [TyphoonDefinition withClass:[DRVCountryPickerViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(presenter) with:[self countryPickerPresenter]];
    }];
}

- (id <DRVCountryPickerInteractorOutput, DRVCountryPickerViewOutput>)countryPickerPresenter {
    return [TyphoonDefinition withClass:[DRVCountryPickerPresenter class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(interactor) with:[self countryPickerInteractor]];
        [definition injectProperty:@selector(view) with:[self countryPickerViewController]];
    }];
}
- (id <DRVCountryPickerInteractorInput>)countryPickerInteractor {
    return [TyphoonDefinition withClass:[DRVCountryPickerInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(countryGeoService) with:[self countryGeoServiceBase]];
        [definition injectProperty:@selector(countryService) with:[self countryServiceBase]];
        [definition injectProperty:@selector(presenter) with:[self countryPickerPresenter]];
    }];
}

- (id <DRVCountryGeoService>)countryGeoServiceBase {
    return [TyphoonDefinition withClass:[DRVCountryGeoServiceBase class]];
}

- (id <DRVCountryService>)countryServiceBase {
    return [TyphoonDefinition withClass:[DRVCountryServiceBase class]];
}

@end
