//
//  HashtelSpec.m
//  Hashtel
//
//  Created by Jurre Stender on 02/03/14.
//  Copyright (c) 2014 jurre. All rights reserved.
//

#import "Kiwi.h"
#import "HASHashtel.h"

SPEC_BEGIN(HASHashtelSpec)

describe(@"HASHashtel", ^{
    describe(@"#colorForString:", ^{
        it(@"returns a valid color", ^{
            HASHashtel *hashtel = [[HASHashtel alloc] init];
            HASColor *color = [hashtel colorForString:@"foo"];
            CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
            [color getRed:&red green:&green blue:&blue alpha:&alpha];
            [[@(red) should] beBetween:@(0) and:@(255)];
            [[@(green) should] beBetween:@(0) and:@(255)];
            [[@(blue) should] beBetween:@(0) and:@(255)];
            [[@(alpha) should] equal:@(1)];
        });

        it(@"returns white for an empty string", ^{
            HASHashtel *hashtel = [[HASHashtel alloc] init];
            [[[hashtel colorForString:@""] should] equal:[HASColor whiteColor]];
        });

        it(@"returns a valid color for single character string", ^{
            HASHashtel *hashtel = [[HASHashtel alloc] init];
            HASColor *color = [hashtel colorForString:@"a"];
            CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha = 0.0;
            [color getRed:&red green:&green blue:&blue alpha:&alpha];
            [[@(red) should] beBetween:@(0) and:@(255)];
            [[@(green) should] beBetween:@(0) and:@(255)];
            [[@(blue) should] beBetween:@(0) and:@(255)];
            [[@(alpha) should] equal:@(1)];
        });
    });
});

SPEC_END
