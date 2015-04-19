//
//  DRVCountry.h
//  CareDrive
//
//  Created by Egor Tolstoy on 17.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DRVInfoCategoryEntity, DRVPenaltyEntity, DRVPoliceInfoEntity, DRVRoadSignEntity, DRVPlatesInfoEntity;

@interface DRVCountryEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * isoCode;
@property (nonatomic, retain) id flagColors;
@property (nonatomic, retain) NSString * introduction;
@property (nonatomic, retain) NSSet *infoCategories;
@property (nonatomic, retain) NSSet *roadSigns;
@property (nonatomic, retain) NSSet *penalties;
@property (nonatomic, retain) DRVPoliceInfoEntity *policeInfo;
@property (nonatomic, retain) DRVPlatesInfoEntity *platesInfo;
@end

@interface DRVCountryEntity (CoreDataGeneratedAccessors)

- (void)addInfoCategoriesObject:(DRVInfoCategoryEntity *)value;
- (void)removeInfoCategoriesObject:(DRVInfoCategoryEntity *)value;
- (void)addInfoCategories:(NSSet *)values;
- (void)removeInfoCategories:(NSSet *)values;

- (void)addRoadSignsObject:(DRVRoadSignEntity *)value;
- (void)removeRoadSignsObject:(DRVRoadSignEntity *)value;
- (void)addRoadSigns:(NSSet *)values;
- (void)removeRoadSigns:(NSSet *)values;

- (void)addPenaltiesObject:(DRVPenaltyEntity *)value;
- (void)removePenaltiesObject:(DRVPenaltyEntity *)value;
- (void)addPenalties:(NSSet *)values;
- (void)removePenalties:(NSSet *)values;

@end
