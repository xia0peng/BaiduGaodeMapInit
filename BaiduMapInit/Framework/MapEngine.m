//
//  MapEngine.m
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/12/4.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapEngine.h"
#import "BaiduMapFactory.h"
#import "GaodeMapFactory.h"
#import "PlatformXmlParser.h"
#import "Platform.h"

@interface MapEngine()
@property (nonatomic,strong)id<IMapFactory> factory;
@end

@implementation MapEngine

- (id<IMapFactory>)getFactory:(MapType)type{
    
    //返回具体的工厂
    switch (_mapType) {
        case MapTypeBaiduMap:
            return [[BaiduMapFactory alloc] init];
            break;
        case MapTypeGaodeMap:
            return [[GaodeMapFactory alloc] init];
            break;
            
        default:
            break;
    }
    //默认工厂
    return [[BaiduMapFactory alloc] init];
}

-(instancetype)init{
    self = [super init];
    if (self) {
        [self initMap];
    }
    return self;
}

-(void)initMap{
    PlatformXmlParser* parser = [[PlatformXmlParser alloc] init];
    NSMutableArray* array = [parser parser];
    //动态创建实例对象(Runtime动态创建)
    NSLog(@"%@",array);
    
    for (Platform *plat in array) {
        if ([plat.isOpen isEqualToString:@"YES"]) {
            Class targetClass = NSClassFromString(plat.factoryName);
            _factory = [[targetClass alloc] init];
        }
    }
}

-(id<IMapFactory>)getFactory{
    return _factory;
}

@end
