//
//  ViewController.m
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/11/30.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import "ViewController.h"

//优化后不需要再次导入繁琐的头文件，不需要在AppDelegate中有相关操作
//#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
//#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

//#import <MAMapKit/MAMapKit.h>
//#import <AMapFoundationKit/AMapFoundationKit.h>

#import "MapEngine.h"

#import "BaiduMapView.h"
#import "BaiduMapFactory.h"

#import "GaodeMapView.h"
#import "GaodeMapFactory.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     *  百度地图普通写法
     *  缺点：
     *  需要导入低头相关头文件
     *  AppDelegate中需要导入头文件  需要注册地图
     *  不能延后加载（使用地图的时候在加载）
     *
    BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
    self.view = mapView;
     */
    
    /*
    id<IMapView> mapView = [[BaiduMapView alloc]initWithFrame:self.view.frame];
    self.view = [mapView getView];
    */
    
    /**
     *  高德地图普通写法
     *
    //地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    [AMapServices sharedServices].enableHTTPS = YES;
    //初始化地图
    MAMapView *_mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mapView];
    */
    
    
    /**
     *  代码结构最终优化（解决方案：工厂模式->地图切换分析、实现原理）
     *  动态切换（配置）
     *  第一个方案：通过宏定义（枚举）实现
     *  第二个方案：配置文件（xml配置、josn配置文件等。。。）
     */
    
    
     //第一个方案：通过宏定义（枚举）实现
//    MapEngine *mapEngine = [[MapEngine alloc] init];
//    id<IMapFactory> factory = [mapEngine getFactory:MapTypeBaiduMap];
//    id<IMapView> mapView = [factory getMapView:self.view.frame];
//    [self.view addSubview:[mapView getView]];
    
    
    //第二个方案：配置文件（xml配置、josn配置文件等。。。）
    MapEngine *mapEngine = [[MapEngine alloc] init];
    id<IMapFactory> factory = [mapEngine getFactory];
    id<IMapView> mapView = [factory getMapView:self.view.frame];
    [self.view addSubview:[mapView getView]];

}


@end
