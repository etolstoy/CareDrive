//
//  DRVCountryModel.h
//  CareDrive
//
//  Created by Egor Tolstoy on 19.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRVCountryModel : NSObject

+ (instancetype)objectWithName:(NSString *)name countryCode:(NSString *)countryCode flagColors:(NSArray *)flagColors;

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *countryCode;
@property (strong, nonatomic, readonly) NSArray *flagColors;

@end
