//
//  DRVRouter.h
//  CareDrive
//
//  Created by Egor Tolstoy on 19.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIViewController+Routing/UIViewController+Routing.h>

@protocol DRVRouter <YDRouter>

- (void)setupCurrentModule;

@end
