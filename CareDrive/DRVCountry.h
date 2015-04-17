//
//  DRVCountry.h
//  CareDrive
//
//  Created by Egor Tolstoy on 17.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DRVInfoCategory, DRVPenalty, DRVPoliceInfo, DRVRoadSign, DRVPlatesInfo;

@interface DRVCountry : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * isoCode;
@property (nonatomic, retain) id flagColors;
@property (nonatomic, retain) NSString * introduction;
@property (nonatomic, retain) NSSet *infoCategories;
@property (nonatomic, retain) NSSet *roadSigns;
@property (nonatomic, retain) NSSet *penalties;
@property (nonatomic, retain) DRVPoliceInfo *policeInfo;
@property (nonatomic, retain) DRVPlatesInfo *platesInfo;
@end

@interface DRVCountry (CoreDataGeneratedAccessors)

- (void)addInfoCategoriesObject:(DRVInfoCategory *)value;
- (void)removeInfoCategoriesObject:(DRVInfoCategory *)value;
- (void)addInfoCategories:(NSSet *)values;
- (void)removeInfoCategories:(NSSet *)values;

- (void)addRoadSignsObject:(DRVRoadSign *)value;
- (void)removeRoadSignsObject:(DRVRoadSign *)value;
- (void)addRoadSigns:(NSSet *)values;
- (void)removeRoadSigns:(NSSet *)values;

- (void)addPenaltiesObject:(DRVPenalty *)value;
- (void)removePenaltiesObject:(DRVPenalty *)value;
- (void)addPenalties:(NSSet *)values;
- (void)removePenalties:(NSSet *)values;

@end
