//
//  BaiduMapView.m
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/11/30.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import "BaiduMapView.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

@interface BaiduMapView ()

@property(nonatomic)BMKMapView* mapView;

@end

@implementation BaiduMapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _mapView = [[BMKMapView alloc]initWithFrame:frame];
    }
    return self;
}

-(UIView *)getView{
    return _mapView;
}

@end
