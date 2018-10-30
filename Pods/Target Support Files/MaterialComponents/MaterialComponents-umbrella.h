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

#import "MaterialFlexibleHeader.h"
#import "MDCFlexibleHeaderContainerViewController.h"
#import "MDCFlexibleHeaderView+ShiftBehavior.h"
#import "MDCFlexibleHeaderView.h"
#import "MDCFlexibleHeaderViewController.h"
#import "MaterialPageControl.h"
#import "MDCPageControl.h"
#import "MaterialApplication.h"
#import "UIApplication+AppExtensions.h"
#import "MaterialUIMetrics.h"
#import "MDCLayoutMetrics.h"

FOUNDATION_EXPORT double MaterialComponentsVersionNumber;
FOUNDATION_EXPORT const unsigned char MaterialComponentsVersionString[];

