//
//  DRVCountryModel.m
//  CareDrive
//
//  Created by Egor Tolstoy on 19.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVCountryModel.h"

@interface DRVCountryModel ()

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) NSString *countryCode;
@property (strong, nonatomic, readwrite) NSArray *flagColors;

@end

@implementation DRVCountryModel

#pragma mark - Инициализация

- (instancetype)initWithName:(NSString *)name countryCode:(NSString *)countryCode flagColors:(NSArray *)flagColors {
    if (self = [super init]) {
        _name = name;
        _countryCode = countryCode;
        _flagColors = flagColors;
    }
    return self;
}

+ (instancetype)objectWithName:(NSString *)name countryCode:(NSString *)countryCode flagColors:(NSArray *)flagColors {
    return [[[self class] alloc] initWithName:name countryCode:countryCode flagColors:flagColors];
}

@end
