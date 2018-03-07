//
//  GaodeMapView.m
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/12/3.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import "GaodeMapView.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

@interface GaodeMapView ()

@property(nonatomic)MAMapView* mapView;

@end

@implementation GaodeMapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        _mapView = [[MAMapView alloc] initWithFrame:frame];
    }
    return self;
}

-(UIView *)getView{
    return _mapView;
}



@end
