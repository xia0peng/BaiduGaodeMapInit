//
//  GaodeMapFactory.m
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/12/4.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import "GaodeMapFactory.h"
#import "GaodeMapView.h"

#import <AMapFoundationKit/AMapFoundationKit.h>

@implementation GaodeMapFactory

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [AMapServices sharedServices].apiKey = @"481b343252a4f61ff7a5e206b952ce99";
    }
    return self;
}

-(id<IMapView>)getMapView:(CGRect)frame{
    //返回具体的地图
    return [[GaodeMapView alloc]initWithFrame:frame];
}

@end
