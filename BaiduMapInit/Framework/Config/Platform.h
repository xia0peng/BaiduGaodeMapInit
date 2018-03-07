//
//  Platform.h
//  Dream_Architect_FactoryMethod_OC_Example
//
//  Created by Dream on 2016/11/25.
//  Copyright © 2016年 Tz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Platform : NSObject

@property (nonatomic,strong) NSString* mapId;

@property (nonatomic,strong) NSString* appKey;

@property (nonatomic,strong) NSString* factoryName;

@property (nonatomic,strong) NSString* isOpen;

@end
