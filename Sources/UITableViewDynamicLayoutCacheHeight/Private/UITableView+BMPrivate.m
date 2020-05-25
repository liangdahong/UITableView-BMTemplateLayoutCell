//    MIT License
//
//    Copyright (c) 2019 https://github.com/liangdahong
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

#import "UITableView+BMPrivate.h"
#import <objc/runtime.h>
#import "UITableViewDynamicLayoutCacheHeight.h"

#define kIS_VERTICAL (UIScreen.mainScreen.bounds.size.height > UIScreen.mainScreen.bounds.size.width)
#define kDefaultHeight @(-1.0)

#ifdef DEBUG
    #define kChangedCacheLog [self _changedCacheLog];
#else
    #define kChangedCacheLog
#endif


@interface UITableView (__BMPrivate__)

@property (nonatomic, strong, readonly) NSMutableDictionary <id<NSCopying>, NSNumber *> *headerVerticalDictionary;
@property (nonatomic, strong, readonly) NSMutableDictionary <id<NSCopying>, NSNumber *> *headerHorizontalDictionary;
@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *> *headerVerticalArray;
@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *> *headerHorizontalArray;

@property (nonatomic, strong, readonly) NSMutableDictionary <id<NSCopying>, NSNumber *> *verticalDictionary;
@property (nonatomic, strong, readonly) NSMutableDictionary <id<NSCopying>, NSNumber *> *horizontalDictionary;
@property (nonatomic, strong, readonly) NSMutableArray <NSMutableArray <NSNumber *> *> *verticalArray;
@property (nonatomic, strong, readonly) NSMutableArray <NSMutableArray <NSNumber *> *> *horizontalArray;

@property (nonatomic, strong, readonly) NSMutableDictionary <id<NSCopying>, NSNumber *> *footerVerticalDictionary;
@property (nonatomic, strong, readonly) NSMutableDictionary <id<NSCopying>, NSNumber *> *footerHorizontalDictionary;
@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *> *footerVerticalArray;
@property (nonatomic, strong, readonly) NSMutableArray <NSNumber *> *footerHorizontalArray;

@end

@implementation UITableView (BMPrivate)

#pragma mark - header property

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)headerHeightDictionary {
    return kIS_VERTICAL ? self.headerVerticalDictionary : self.headerHorizontalDictionary;
}

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)headerVerticalDictionary {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((dict == nil), 0)) {
        dict = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)headerHorizontalDictionary {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((dict == nil), 0)) {
        dict = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (NSMutableArray<NSNumber *> *)headerHeightArray {
    return kIS_VERTICAL ? self.headerVerticalArray : self.headerHorizontalArray;
}

- (NSMutableArray<NSNumber *> *)headerVerticalArray {
    NSMutableArray *arr = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((arr == nil), 0)) {
        arr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}

- (NSMutableArray<NSNumber *> *)headerHorizontalArray {
    NSMutableArray *arr = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((arr == nil), 0)) {
        arr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}

#pragma mark - cell property

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)heightDictionary {
    return kIS_VERTICAL ? self.verticalDictionary : self.horizontalDictionary;
}

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)verticalDictionary {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((dict == nil), 0)) {
        dict = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)horizontalDictionary {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((dict == nil), 0)) {
        dict = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (NSMutableArray<NSMutableArray<NSNumber *> *> *)heightArray {
    return kIS_VERTICAL ? self.verticalArray : self.horizontalArray;
}

- (NSMutableArray<NSMutableArray<NSNumber *> *> *)verticalArray {
    NSMutableArray *arr = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((arr == nil), 0)) {
        arr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}

- (NSMutableArray<NSMutableArray <NSNumber *> *> *)horizontalArray {
    NSMutableArray *arr = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((arr == nil), 0)) {
        arr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}

#pragma mark - footer property

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)footerHeightDictionary {
    return kIS_VERTICAL ? self.footerVerticalDictionary : self.footerHorizontalDictionary;
}

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)footerVerticalDictionary {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((dict == nil), 0)) {
        dict = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (NSMutableDictionary<id<NSCopying>, NSNumber *> *)footerHorizontalDictionary {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((dict == nil), 0)) {
        dict = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

- (NSMutableArray<NSNumber *> *)footerHeightArray {
    return kIS_VERTICAL ? self.footerVerticalArray : self.footerHorizontalArray;
}

- (NSMutableArray<NSNumber *> *)footerVerticalArray {
    NSMutableArray *arr = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((arr == nil), 0)) {
        arr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}

- (NSMutableArray<NSNumber *> *)footerHorizontalArray {
    NSMutableArray *arr = objc_getAssociatedObject(self, _cmd);
    if (__builtin_expect((arr == nil), 0)) {
        arr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, arr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return arr;
}

#pragma mark - load

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selectors[] = {
            @selector(setDataSource:),

            @selector(reloadData),

            @selector(insertSections:withRowAnimation:),
            @selector(deleteSections:withRowAnimation:),
            @selector(reloadSections:withRowAnimation:),
            @selector(moveSection:toSection:),

            @selector(insertRowsAtIndexPaths:withRowAnimation:),
            @selector(deleteRowsAtIndexPaths:withRowAnimation:),
            @selector(reloadRowsAtIndexPaths:withRowAnimation:),
            @selector(moveRowAtIndexPath:toIndexPath:)
        };
        
        for (NSUInteger index = 0; index < sizeof(selectors) / sizeof(SEL); ++index) {
            SEL originalSelector = selectors[index];
            SEL swizzledSelector = NSSelectorFromString([@"tableView_dynamicLayout_" stringByAppendingString:NSStringFromSelector(originalSelector)]);
            Method originalMethod = class_getInstanceMethod(self, originalSelector);
            Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)tableView_dynamicLayout_setDataSource:(id<UITableViewDataSource>)dataSource {
    if (dataSource) {
        BM_UITableView_DynamicLayout_LOG(@"initCacheArray %@", NSStringFromSelector(_cmd));
        [self _initCacheArrayWithDataSource:dataSource];
    }
    [self tableView_dynamicLayout_setDataSource:dataSource];
}

- (void)tableView_dynamicLayout_reloadData {
    BM_UITableView_DynamicLayout_LOG(@"initCacheArray %@", NSStringFromSelector(_cmd));
    [self _initCacheArrayWithDataSource:self.dataSource];
    [self tableView_dynamicLayout_reloadData];
}

- (void)tableView_dynamicLayout_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    if (1 == sections.count) {
        NSInteger rowCount = [self.dataSource tableView:self numberOfRowsInSection:sections.firstIndex];
        NSMutableArray *arr = @[].mutableCopy;
        while (rowCount-- > 0) {
            [arr addObject:kDefaultHeight];
        }
        // cell
        [self.verticalArray   insertObject:arr             atIndex:sections.firstIndex];
        [self.horizontalArray insertObject:arr.mutableCopy atIndex:sections.firstIndex];
        // header footer
        [self.headerVerticalArray   insertObject:kDefaultHeight atIndex:sections.firstIndex];
        [self.headerHorizontalArray insertObject:kDefaultHeight atIndex:sections.firstIndex];
        [self.footerVerticalArray   insertObject:kDefaultHeight atIndex:sections.firstIndex];
        [self.footerHorizontalArray insertObject:kDefaultHeight atIndex:sections.firstIndex];
    } else {
        // 如果多于 1 暂时全部初始化。
        [self _initCacheArrayWithDataSource:self.dataSource];
    }
    kChangedCacheLog
    [self tableView_dynamicLayout_insertSections:sections withRowAnimation:animation];
}

- (void)tableView_dynamicLayout_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    [sections enumerateIndexesWithOptions:(NSEnumerationReverse) usingBlock:^(NSUInteger section, BOOL * _Nonnull stop) {
        // cell
        [self.verticalArray         removeObjectAtIndex:section];
        [self.horizontalArray       removeObjectAtIndex:section];
        // header footer
        [self.headerVerticalArray   removeObjectAtIndex:section];
        [self.headerHorizontalArray removeObjectAtIndex:section];
        [self.footerVerticalArray   removeObjectAtIndex:section];
        [self.footerHorizontalArray removeObjectAtIndex:section];
    }];
    kChangedCacheLog
    [self tableView_dynamicLayout_deleteSections:sections withRowAnimation:animation];
}

- (void)tableView_dynamicLayout_reloadSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    // 把相应组的高度缓存设置为无效
    [sections enumerateIndexesUsingBlock:^(NSUInteger section, BOOL * _Nonnull stop) {
        // cell
        [self.verticalArray[section] enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            self.verticalArray[section][idx]   = kDefaultHeight;
            self.horizontalArray[section][idx] = kDefaultHeight;
        }];
        // header footer
        self.headerVerticalArray[section]   = kDefaultHeight;
        self.headerHorizontalArray[section] = kDefaultHeight;
        self.footerVerticalArray[section]   = kDefaultHeight;
        self.footerHorizontalArray[section] = kDefaultHeight;
    }];
    kChangedCacheLog
    [self tableView_dynamicLayout_reloadSections:sections withRowAnimation:animation];
}

- (void)tableView_dynamicLayout_moveSection:(NSInteger)section toSection:(NSInteger)newSection {
//    id temp1 = self.verticalArray[section];
//    [self.verticalArray removeObjectAtIndex:section];
//    [self.verticalArray insertObject:temp1 atIndex:newSection];
//
//    id temp2 = self.horizontalArray[section];
//    [self.horizontalArray removeObjectAtIndex:section];
//    [self.horizontalArray insertObject:temp2 atIndex:newSection];
//
//    id temp3 = self.headerVerticalArray[section];
//    [self.headerVerticalArray removeObjectAtIndex:section];
//    [self.headerVerticalArray insertObject:temp3 atIndex:newSection];
//    id temp4 = self.headerHorizontalArray[section];
//    [self.headerHorizontalArray removeObjectAtIndex:section];
//    [self.headerHorizontalArray insertObject:temp4 atIndex:newSection];
//
//    id temp5 = self.footerVerticalArray[section];
//    [self.footerVerticalArray removeObjectAtIndex:section];
//    [self.footerVerticalArray insertObject:temp5 atIndex:newSection];
//    id temp6 = self.footerHorizontalArray[section];
//    [self.footerHorizontalArray removeObjectAtIndex:section];
//    [self.footerHorizontalArray insertObject:temp6 atIndex:newSection];
    
    // 暂时全部初始化。
    [self _initCacheArrayWithDataSource:self.dataSource];
    kChangedCacheLog
    [self tableView_dynamicLayout_moveSection:section toSection:newSection];
}

- (void)tableView_dynamicLayout_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
//    NSMutableArray *tempIndexPaths = indexPaths.mutableCopy;
//    [tempIndexPaths sortUsingComparator:^NSComparisonResult(NSIndexPath *  _Nonnull obj1, NSIndexPath *  _Nonnull obj2) {
//        if (obj1.section == obj2.section) {
//            return obj1.row > obj2.row;
//        }
//        return obj1.section > obj2.section;
//    }];
//    [tempIndexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx1, BOOL * _Nonnull stop1) {
//        NSMutableArray <NSMutableArray <NSNumber *> *> *arr = self.verticalArray;
//        long i = (obj.section + 1 - arr.count);
//        while (i-- > 0) {
//            [self.verticalArray insertObject:@[].mutableCopy atIndex:obj.section];
//            [self.horizontalArray insertObject:@[].mutableCopy atIndex:obj.section];
//        }
//        [self.verticalArray[obj.section] insertObject:kDefaultHeight atIndex:obj.row];
//        [self.horizontalArray[obj.section] insertObject:kDefaultHeight atIndex:obj.row];
//    }];
    
    // 暂时全部初始化。
    [self _initCacheArrayWithDataSource:self.dataSource];
    kChangedCacheLog
    [self tableView_dynamicLayout_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)tableView_dynamicLayout_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    NSMutableArray *tempIndexPaths = indexPaths.mutableCopy;
    [tempIndexPaths sortUsingComparator:^NSComparisonResult(NSIndexPath *  _Nonnull obj1, NSIndexPath *  _Nonnull obj2) {
        if (obj1.section == obj2.section) {
            return obj1.row < obj2.row;
        }
        return obj1.section < obj2.section;
    }];
    [tempIndexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.verticalArray[obj.section]   removeObjectAtIndex:obj.row];
        [self.horizontalArray[obj.section] removeObjectAtIndex:obj.row];
    }];
    kChangedCacheLog
    [self tableView_dynamicLayout_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)tableView_dynamicLayout_reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [indexPaths enumerateObjectsUsingBlock:^(NSIndexPath * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        self.verticalArray[obj.section][obj.row]   = kDefaultHeight;
        self.horizontalArray[obj.section][obj.row] = kDefaultHeight;
    }];
    kChangedCacheLog
    [self tableView_dynamicLayout_reloadRowsAtIndexPaths:indexPaths withRowAnimation:animation];
}

- (void)tableView_dynamicLayout_moveRowAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath {
//    if (indexPath.section == newIndexPath.section) {
//        NSInteger sec = indexPath.section;
//        id obj = self.verticalArray[sec][indexPath.row];
//        [self.verticalArray[sec] removeObjectAtIndex:indexPath.row];
//        [self.verticalArray[sec] insertObject:obj atIndex:newIndexPath.row];
//
//        id obj1 = self.horizontalArray[sec][indexPath.row];
//        [self.horizontalArray[sec] removeObjectAtIndex:indexPath.row];
//        [self.horizontalArray[sec] insertObject:obj1 atIndex:newIndexPath.row];
//
//    } else {
//        id obj = self.verticalArray[indexPath.section][indexPath.row];
//        [self.verticalArray[indexPath.section] removeObjectAtIndex:indexPath.row];
//        [self.verticalArray[newIndexPath.section] insertObject:obj atIndex:newIndexPath.row];
//
//        id obj1 = self.horizontalArray[indexPath.section][indexPath.row];
//        [self.horizontalArray[indexPath.section] removeObjectAtIndex:indexPath.row];
//        [self.horizontalArray[newIndexPath.section] insertObject:obj1 atIndex:newIndexPath.row];
//    }
    
    // 暂时全部初始化。
    [self _initCacheArrayWithDataSource:self.dataSource];
    kChangedCacheLog
    [self tableView_dynamicLayout_moveRowAtIndexPath:indexPath toIndexPath:newIndexPath];
}

#pragma mark - 私有方法

- (void)_initCacheArrayWithDataSource:(id<UITableViewDataSource>)dataSource {
    if (!dataSource) {
        return;
    }
    BM_UITableView_DynamicLayout_LOG(@"初始化缓存");
    // 1、清空 cell 的以 IndexPath 为标识的高度缓存
    NSInteger sections = 1;
    if ([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sections = [dataSource numberOfSectionsInTableView:self];
    }

    // 1-1、竖屏状态下的 cell 高度缓存
    // 1-2、横屏状态下的 cell 高度缓存
    NSInteger tempSections = 0;
    NSMutableArray *verticalArray = @[].mutableCopy;
    NSMutableArray *horizontalArray = @[].mutableCopy;
    while (tempSections < sections) {
        NSInteger row = [dataSource tableView:self numberOfRowsInSection:tempSections];
        NSMutableArray *arr = @[].mutableCopy;
        while (row-- > 0) {
            [arr addObject:kDefaultHeight];
        }
        [verticalArray addObject:arr];
        [horizontalArray addObject:arr.mutableCopy];
        tempSections++;
    }
    [self.verticalArray removeAllObjects];
    [self.verticalArray addObjectsFromArray:verticalArray.copy];

    [self.horizontalArray removeAllObjects];
    [self.horizontalArray addObjectsFromArray:horizontalArray.copy];

    [self _initHeaderFooterCacheArrayWithSections:sections];
    [self _initLogCache];
}

- (void)_initHeaderFooterCacheArrayWithSections:(NSInteger)sections {
    // 2-1、竖屏状态下的 HeaderView 高度缓存
    // 2-2、横屏状态下的 HeaderView 高度缓存
    // 2-3、竖屏状态下的 FooterView 高度缓存
    // 2-4、横屏状态下的 FooterView 高度缓存
    [self.headerVerticalArray removeAllObjects];
    [self.headerHorizontalArray removeAllObjects];
    [self.footerVerticalArray removeAllObjects];
    [self.footerHorizontalArray removeAllObjects];
    NSInteger temp = 0;
    while (temp++ < sections) {
        [self.headerVerticalArray addObject:kDefaultHeight];
        [self.headerHorizontalArray addObject:kDefaultHeight];
        [self.footerVerticalArray addObject:kDefaultHeight];
        [self.footerHorizontalArray addObject:kDefaultHeight];
    }
}

- (void)_initLogCache {
#ifdef DEBUG
    if (UITableViewDynamicLayoutCacheHeight.isOpenDebugLog) {
        [self.verticalArray enumerateObjectsUsingBlock:^(NSMutableArray<NSNumber *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BM_UITableView_DynamicLayout_LOG(@"初始化: 初始化后 cell 竖屏：%@", @(obj.count));
        }];
        [self.horizontalArray enumerateObjectsUsingBlock:^(NSMutableArray<NSNumber *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BM_UITableView_DynamicLayout_LOG(@"初始化: 初始化后 cell 横屏：%@", @(obj.count));
        }];
        BM_UITableView_DynamicLayout_LOG(@"初始化: 初始化后 header 竖屏：%@", @(self.headerVerticalArray.count));
        BM_UITableView_DynamicLayout_LOG(@"初始化: 初始化后 header 横屏：%@", @(self.headerHorizontalArray.count));
        BM_UITableView_DynamicLayout_LOG(@"初始化: 初始化后 footer 竖屏：%@", @(self.footerVerticalArray.count));
        BM_UITableView_DynamicLayout_LOG(@"初始化: 初始化后 footer 横屏：%@", @(self.footerHorizontalArray.count));
    }
#endif
}

- (void)_changedCacheLog {
#ifdef DEBUG
    if (UITableViewDynamicLayoutCacheHeight.isOpenDebugLog) {
        [self.verticalArray enumerateObjectsUsingBlock:^(NSMutableArray<NSNumber *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BM_UITableView_DynamicLayout_LOG(@"修改了数据时: 初始化后 cell 竖屏：%@", @(obj.count));
        }];
        [self.horizontalArray enumerateObjectsUsingBlock:^(NSMutableArray<NSNumber *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            BM_UITableView_DynamicLayout_LOG(@"修改了数据时: 初始化后 cell 横屏：%@", @(obj.count));
        }];
        BM_UITableView_DynamicLayout_LOG(@"修改了数据时: 初始化后 header 竖屏：%@", @(self.headerVerticalArray.count));
        BM_UITableView_DynamicLayout_LOG(@"修改了数据时: 初始化后 header 横屏：%@", @(self.headerHorizontalArray.count));
        BM_UITableView_DynamicLayout_LOG(@"修改了数据时: 初始化后 footer 竖屏：%@", @(self.footerVerticalArray.count));
        BM_UITableView_DynamicLayout_LOG(@"修改了数据时: 初始化后 footer 横屏：%@", @(self.footerHorizontalArray.count));
    }
#endif
}

@end
