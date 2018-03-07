//
//  ViewController.m
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/11/30.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import "ViewController.h"

//#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
//#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

//#import <MAMapKit/MAMapKit.h>
//#import <AMapFoundationKit/AMapFoundationKit.h>

#import "BaiduMapView.h"
#import "GaodeMapView.h"
#import "BaiduMapFactory.h"
#import "GaodeMapFactory.h"
#import "MapEngine.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    /**
     *  百度地图普通写法
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
    //把地图添加至view
    [self.view addSubview:_mapView];
    */
    
    /*
    id<IMapView> mapView = [[GaodeMapView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:[mapView getView]];
     */
    
//    代码结构进一步优化（解决方案：工厂模式->百度地图工厂设计）
//    id<IMapFactory> factory = [[BaiduMapFactory alloc]init];
//    id<IMapView> mapView = [factory getMapView:self.view.frame];
//    [self.view addSubview:[mapView getView]];
    
//    id<IMapFactory> factory = [[GaodeMapFactory alloc]init];
//    id<IMapView> mapView = [factory getMapView:self.view.frame];
//    [self.view addSubview:[mapView getView]];
    
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
//    [mapEngine initMap];
    id<IMapFactory> factory = [mapEngine getFactory];
    id<IMapView> mapView = [factory getMapView:self.view.frame];
    [self.view addSubview:[mapView getView]];

}


@end
