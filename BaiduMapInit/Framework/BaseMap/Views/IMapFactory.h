//
//  IMapFactory.h
//  BaiduMapInit
//
//  Created by xiaopeng on 2017/12/3.
//  Copyright © 2017年 王小朋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMapView.h"

/**
 *  工厂标准协议
 */
@protocol IMapFactory <NSObject>

-(id<IMapView>)getMapView:(CGRect)frame;

@end
