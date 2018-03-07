//
//  MapEngine.h
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/12/4.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMapFactory.h"

typedef NS_ENUM(NSInteger, MapType) {
    
    MapTypeBaiduMap = 0,
    MapTypeGaodeMap,
};

/**
 *  地图引擎的目的：用于管理所有的工厂
 */
@interface MapEngine : NSObject

@property (nonatomic, assign) MapType mapType;

//返回具体的工厂 第一个方案：通过宏定义（枚举）实现
- (id<IMapFactory>)getFactory:(MapType)type;

//第二个方案：配置文件（xml配置、josn配置文件等。。。）
- (id<IMapFactory>)getFactory;

@end
