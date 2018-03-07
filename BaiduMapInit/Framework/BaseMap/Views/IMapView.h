//
//  IMapView.h
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/11/30.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  地图标准协议
 */
@protocol IMapView <NSObject>

- (UIView *)getView;

- (instancetype)initWithFrame:(CGRect)frame;

@end
