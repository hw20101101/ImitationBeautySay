//
//  UIColor+Hex.m
//  ImitationBeautySay
//
//  Created by hw on 2016/12/20.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+(UIColor *)colorWithHex:(NSUInteger)hex
{
    float b=(hex&0xFF)/255.f;
    float g=((hex>>8) & 0xFF)/255.f;
    float r=((hex >> 16) & 0xFF)/255.f;
    float a=hex> 0xFFFFFF ? ((hex>>24)& 0xFF)/255.f : 1.0;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
