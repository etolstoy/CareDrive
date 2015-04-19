//
//  DRVPenalty.h
//  CareDrive
//
//  Created by Egor Tolstoy on 17.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface DRVPenaltyEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * detailText;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSManagedObject *country;

@end
