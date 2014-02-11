//
//  UIColor+FlatColors.m
//  Tables
//
//  Created by Kyle Adams on 20-11-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "UIColor+FlatColors.h"

@implementation UIColor (FlatColors)

+ (UIColor *)flatBlueColor {
    return [UIColor colorWithRed:0/255.0f green:122/255.0f blue:255/255.0f alpha:1.0f];
}
    
+ (UIColor *)flatGreenColor {
    return [UIColor colorWithRed:26/255.0f green:188/255.0f blue:156/255.0f alpha:1];
}

+ (UIColor *)flatOrangeColor {
    return [UIColor colorWithRed:255/255.0f green:149/255.0f blue:0/255.0f alpha:1.0f];
}

+ (UIColor *)flatPinkColor {
    return [UIColor colorWithRed:255/255.0f green:45/255.0f blue:85/255.0f alpha:1.0f];
}

+ (UIColor *)flatPurpleColor {
    return [UIColor colorWithRed:88/255.0f green:86/255.0f blue:214/255.0f alpha:1.0f];
}

+ (UIColor *)flatRedColor {
    return [UIColor colorWithRed:255/255.0f green:59/255.0f blue:48/255.0f alpha:1.0f];
}

+ (UIColor *)flatYellowColor {
    return [UIColor colorWithRed:255/255.0f green:204/255.0f blue:0/255.0f alpha:1.0f];
}

+ (UIColor *)flatGreyColor {
    return [UIColor colorWithRed:199/255.0f green:199/255.0f blue:204/255.0f alpha:1.0f];;
}

+ (UIColor *)randomFlatColor
{
    switch (arc4random() % 8) {
        case 0: return [UIColor flatRedColor];
        case 1: return [UIColor flatOrangeColor];
        case 2: return [UIColor flatYellowColor];
        case 3: return [UIColor flatGreenColor];
        case 4: return [UIColor flatBlueColor];
        case 5: return [UIColor flatPurpleColor];
        case 6: return [UIColor flatPinkColor];
        case 7: return [UIColor flatGreyColor];
    }
    return [UIColor blackColor];
}

@end
