//
//  DRVRouterBase.m
//  CareDrive
//
//  Created by Egor Tolstoy on 19.04.15.
//  Copyright (c) 2015 Egor Tolstoy. All rights reserved.
//

#import "DRVRouterBase.h"

@implementation DRVRouterBase

#pragma mark - prepareForSegue:

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *sourceViewController = segue.sourceViewController;
    YDPreparationBlock block = [sourceViewController preparationBlockForSegue:segue];
    
    if (block) {
        block(segue);
    }
}

@end
