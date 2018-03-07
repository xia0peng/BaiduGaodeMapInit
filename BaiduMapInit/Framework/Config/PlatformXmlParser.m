//
//  PlatformXmlParser.m
//  Dream_Architect_FactoryMethod_OC_Example
//
//  Created by Dream on 2016/11/25.
//  Copyright © 2016年 Tz. All rights reserved.
//

#import "PlatformXmlParser.h"
#include "Platform.h"

//解析工厂
@interface PlatformXmlParser()<NSXMLParserDelegate>

@property (nonatomic) NSMutableArray* array;

@end

@implementation PlatformXmlParser

- (instancetype)init
{
    self = [super init];
    if (self) {
        _array = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSMutableArray*)parser{
    //加载XML配置文件
    //绑定delegate
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Config" ofType:@"map.xml"];
    NSURL* url = [[NSURL alloc] initFileURLWithPath:filePath];
    NSXMLParser* xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    xmlParser.delegate = self;
    //解析
    [xmlParser parse];
    return _array;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict{
    //解析xml
    if([elementName isEqualToString:@"platform"]){
        NSString* mapId = attributeDict[@"id"];
        NSString* appKey = attributeDict[@"appKey"];
        NSString* factoryName = attributeDict[@"factoryName"];
        NSString* isOpen = attributeDict[@"isOpen"];
        Platform* platform = [[Platform alloc] init];
        platform.mapId = mapId;
        platform.appKey = appKey;
        platform.factoryName =factoryName;
        platform.isOpen = isOpen;
        //保存
        [_array addObject:platform];
    }
}

@end
