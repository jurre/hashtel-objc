//
//  HASHashtel.h
//  Hashtel
//
//  Created by Jurre Stender on 02/03/14.
//  Copyright (c) 2014 jurre. All rights reserved.
//

#import <Foundation/Foundation.h>

#if TARGET_OS_IPHONE
#define HASColor UIColor
#else
#define HASColor NSColor
#endif

@interface HASHashtel : NSObject

- (HASColor *)colorForString:(NSString *)string;

@end
