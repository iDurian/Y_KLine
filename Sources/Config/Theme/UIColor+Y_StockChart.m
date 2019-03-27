//
//  UIColor+Y_StockChart.m
//  BTC-Kline
//
//  Created by yate1996 on 16/4/30.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "UIColor+Y_StockChart.h"
//#import "KVConfig.h"

@implementation UIColor (Y_StockChart)

+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}

#pragma mark 所有图表的背景颜色
+(UIColor *)backgroundColor
{
  if ([[NSUserDefaults standardUserDefaults] boolForKey: @"lightMode"]) {
    return [UIColor whiteColor];
  }
  return [UIColor colorWithRed:0.01 green:0.05 blue:0.08 alpha:1.00];
}

#pragma mark 辅助背景色
+(UIColor *)assistBackgroundColor
{
    return [UIColor clearColor];
//    return [UIColor colorWithRGBHex:0x1d2227];
}

#pragma mark 涨的颜色
+(UIColor *)increaseColor
{
//    int klineChinaStyle = [[KVConfig getDataWithKey:@"klineChinaStyle" defaultValue:@"0"] intValue];
//    if (klineChinaStyle == 1) {
        return [UIColor colorWithRGBHex:0xff5353];
//    }
//
//    return [UIColor colorWithRGBHex:0x00b07c];
}

#pragma mark 跌的颜色
+(UIColor *)decreaseColor
{
//    int klineChinaStyle = [[KVConfig getDataWithKey:@"klineChinaStyle" defaultValue:@"0"] intValue];
//    if (klineChinaStyle == 1) {
        return [UIColor colorWithRGBHex:0x00b07c];
//    }
//
//    return [UIColor colorWithRGBHex:0xff5353];
}

#pragma mark 主文字颜色
+(UIColor *)mainTextColor
{
    return [UIColor colorWithRGBHex:0xe1e2e6];
}

#pragma mark 辅助文字颜色
+(UIColor *)assistTextColor
{
    return [UIColor colorWithRGBHex:0x999999];
}

#pragma mark 分时线下面的成交量线的颜色
+(UIColor *)timeLineVolumeLineColor
{
    return [UIColor colorWithRGBHex:0x2d333a];
}

#pragma mark 分时线界面线的颜色
+(UIColor *)timeLineLineColor
{
    return [UIColor colorWithRGBHex:0x49a5ff];
}

#pragma mark 长按时线的颜色
+(UIColor *)longPressLineColor
{
//    return [UIColor colorWithRGBHex:0xff5353];
    return [UIColor colorWithRGBHex:0xe1e2e6];
}

#pragma mark ma5的颜色
+(UIColor *)ma7Color
{
    return [UIColor colorWithRGBHex:0xff783c];
}

#pragma mark ma30颜色
+(UIColor *)ma30Color
{
    return [UIColor colorWithRGBHex:0x49a5ff];
}

#pragma mark BOLL_MB的颜色
+(UIColor *)BOLL_MBColor
{
    return [UIColor whiteColor];
}

#pragma mark BOLL_UP的颜色
+(UIColor *)BOLL_UPColor
{
    return [UIColor purpleColor];
}

#pragma mark BOLL_DN的颜色
+(UIColor *)BOLL_DNColor
{
    return [UIColor greenColor];
}

@end
