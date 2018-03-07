//
//  BaiduMapFactory.m
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/12/3.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import "BaiduMapFactory.h"
#import "BaiduMapView.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

@implementation BaiduMapFactory

- (instancetype)init{
    self = [super init];
    if (self) {
        //初始化地图的SDK
        // 要使用百度地图，请先启动BaiduMapManager
        BMKMapManager *_mapManager = [[BMKMapManager alloc]init];
        // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
        BOOL ret = [_mapManager start:@"haZaPRO1c8zXbGUBw0jcMvIb9PjGScPN"  generalDelegate:nil];
        if (!ret) {
            NSLog(@"manager start failed!");
        }
    }
    return self;
}

//模块创建
//包括：定位、导航...
-(id<IMapView>)getMapView:(CGRect)frame{
    //返回具体的地图
    return [[BaiduMapView alloc]initWithFrame:frame];
}

@end
