//
//  NSString+Hashtel.m
//  Hashtel
//
//  Created by Jurre Stender on 02/03/14.
//  Copyright (c) 2014 jurre. All rights reserved.
//

#import "NSString+Hashtel.h"

@implementation NSString (Hashtel)

- (HASColor *)color {
  HASHashtel *hashtel = [[HASHashtel alloc] init];
  return [hashtel colorForString:self];
}

@end
