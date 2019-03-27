//
//  Y_KLine.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/2.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_KLine.h"
#import "UIColor+Y_StockChart.h"
#import "Y_StockChartGlobalVariable.h"
#import "Y_StockChartConstant.h"
@interface Y_KLine()

/**
 *  context
 */
@property (nonatomic, assign) CGContextRef context;

/**
 *  最后一个绘制日期点
 */
@property (nonatomic, assign) CGPoint lastDrawDatePoint;

@end

@implementation Y_KLine

#pragma mark 根据context初始化
- (instancetype)initWithContext:(CGContextRef)context
{
    self = [super init];
    if (self) {
        _context = context;
        _lastDrawDatePoint = CGPointZero;
    }
    return self;
}

- (NSDateFormatter *)formatter {
    static NSDateFormatter *f;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        f = [[NSDateFormatter alloc] init];
    });
    return f;
}

#pragma 绘制K线 - 单个
- (UIColor *)draw
{
    //判断数据是否为空
    if(!self.kLineModel || !self.context || !self.kLinePositionModel)
    {
        return nil;
    }
    
    CGContextRef context = self.context;
    
    //设置画笔颜色
    UIColor *strokeColor = self.kLinePositionModel.OpenPoint.y < self.kLinePositionModel.ClosePoint.y ? [UIColor increaseColor] : [UIColor decreaseColor];
    
    CGContextSetStrokeColorWithColor(context, strokeColor.CGColor);
    
    //画中间较宽的开收盘线段-实体线
    CGContextSetLineWidth(context, [Y_StockChartGlobalVariable kLineWidth]);
    const CGPoint solidPoints[] = {self.kLinePositionModel.OpenPoint, self.kLinePositionModel.ClosePoint};
    //画线
    CGContextStrokeLineSegments(context, solidPoints, 2);
    
    //画上下影线
    CGContextSetLineWidth(context, Y_StockChartShadowLineWidth);
    const CGPoint shadowPoints[] = {self.kLinePositionModel.HighPoint, self.kLinePositionModel.LowPoint};
    //画线
    CGContextStrokeLineSegments(context, shadowPoints, 2);

//    [self formatter].dateFormat = @"yyyy-MM-dd HH:mm:ss";
  NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self.kLineModel.Date doubleValue] / 1000.0 ];
  
//    NSDate *date = [[self formatter] dateFromString:self.kLineModel.Date];
    [self formatter].dateFormat = _dateFormatter;//@"yyyy-MM-dd HH:mm";
    NSString *dateStr = [[self formatter] stringFromDate:date];
    
    CGPoint drawDatePoint = CGPointMake(self.kLinePositionModel.LowPoint.x + 1, self.maxY + 1.5);
    if(CGPointEqualToPoint(self.lastDrawDatePoint, CGPointZero) || drawDatePoint.x - self.lastDrawDatePoint.x > [_dateFormatter length] * 12)
    {
        [dateStr drawAtPoint:drawDatePoint withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:11],NSForegroundColorAttributeName : [UIColor assistTextColor]}];
        self.lastDrawDatePoint = drawDatePoint;
    }
    return strokeColor;
}

@end
