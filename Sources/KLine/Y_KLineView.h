//
//  Y_KLineView.h
//  BTC-Kline
//
//  Created by yate1996 on 16/4/30.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_KLineModel.h"
#import "Y_StockChartConstant.h"

#define FONT(s)  [UIFont fontWithName:@"DIN-Light" size:s]

@protocol Y_KLineViewDelegate

- (void)didStartLongPress;

- (void)didEndLongPress;

- (void)didUpdateLongPressModel: (Y_KLineModel *)model;

@end

@interface Y_KLineView : UIView

@property (nonatomic, weak) id<Y_KLineViewDelegate> delegate;

/**
 *  第一个View的高所占比例
 */
@property (nonatomic, assign) CGFloat mainViewRatio;

/**
 *  第二个View(成交量)的高所占比例
 */
@property (nonatomic, assign) CGFloat volumeViewRatio;

/**
 *  数据
 */
@property(nonatomic, copy) NSArray<Y_KLineModel *> *kLineModels;

@property(nonatomic, readonly) Y_KLineModel *currentModel;

/**
 *  重绘
 */
- (void)reDraw;


/**
 *  K线类型
 */
@property (nonatomic, assign) Y_StockChartCenterViewType MainViewType;

/**
 *  Accessory指标种类
 */
@property (nonatomic, assign) Y_StockChartTargetLineStatus targetLineStatus;
@end
