#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UITableView+BMPrivate.h"
#import "UITableView+BMDynamicLayout.h"
#import "UITableViewCell+BMDynamicLayout.h"
#import "UITableViewDynamicLayoutCacheHeight.h"
#import "UITableViewHeaderFooterView+BMDynamicLayout.h"

FOUNDATION_EXPORT double UITableViewDynamicLayoutCacheHeightVersionNumber;
FOUNDATION_EXPORT const unsigned char UITableViewDynamicLayoutCacheHeightVersionString[];

