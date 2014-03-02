//
//  HASHashtel.m
//  Hashtel
//
//  Created by Jurre Stender on 02/03/14.
//  Copyright (c) 2014 jurre. All rights reserved.
//

#import "HASHashtel.h"

@implementation HASHashtel

- (HASColor *)colorForString:(NSString *)string {
	if ([string isEqualToString:@""]) {
		return [HASColor whiteColor];
	}


	NSInteger startColor = 92;
	NSInteger colorOffset = 156;

	NSInteger originalRed = [self hashCodeForString:string] % colorOffset;
	NSInteger originalGreen = [self hashCodeForString:[self reverseString:string]] & colorOffset;
	NSInteger originalBlue = colorOffset;

	NSInteger adaptedRed = startColor + originalRed;
	NSInteger adaptedGreen = startColor + originalGreen - originalRed;
	NSInteger adaptedBlue = startColor + originalBlue - originalGreen;

	return [HASColor colorWithRed:(float)adaptedRed / 255
	                        green:(float)adaptedGreen / 255
	                         blue:(float)adaptedBlue / 255
	                        alpha:1];
}

#pragma mark - Private

- (NSString *)reverseString:(NSString *)string {
	NSInteger len = [string length];
	NSMutableString *reversedString = [NSMutableString stringWithCapacity:len];
	while (len > 0) {
		[reversedString appendString:[NSString stringWithFormat:@"%C", [string characterAtIndex:--len]]];
	}

	return reversedString;
}

- (NSInteger)hashCodeForString:(NSString *)string {
	NSMutableArray *stringBuffer = [NSMutableArray arrayWithCapacity:[string length]];
	for (NSInteger i = 0; i < [string length]; i++) {
		[stringBuffer addObject:[NSString stringWithFormat:@"%C", [string characterAtIndex:i]]];
	}

	__block NSInteger memo = [stringBuffer[0] characterAtIndex:0];

	for (NSInteger i = 1; i < [stringBuffer count]; i++) {
		NSString *obj = stringBuffer[i];
		NSUInteger objHashCode = [obj characterAtIndex:0];

		NSUInteger hash = ((memo << 3) - memo) + objHashCode;
		memo = labs(hash & hash);
	}

	return memo;
}

@end
