//
//  BMHomeVC+BMIndexPathTest.h
//  UITableViewDynamicLayoutCacheHeight
//
//  Created by mac on 2020/4/5.
//  Copyright © 2020 liangdahong. All rights reserved.
//

#import "BMHomeVC.h"

@interface BMHomeVC (BMIndexPathTest)

- (void)insertRowsAtIndexPaths;
- (void)deleteIndexPaths;
- (void)reloadIndexPaths;
- (void)moveIndexPaths;
- (void)reloadData;

@end