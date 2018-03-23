# BaiduGaodeMapInit

 
 ## Framework的设计思路
 

### 以集成地图为例。使代码扩展性非常高，解耦合。

 
  需求：希望快速切换地图引擎（切换百度地图、高德地图）
     
  情景：现在项目中使用的是百度（高德）地图，由于种种原因，现在公司要使用高德（百度）地图。。。。这是时候就很麻烦了！！！
 
 
 ## 思路：使用工厂模式设计优化代码结构
 
### 优点：
- 不用在每个使用的地方都导入地图头文件
- 不用在AppDelegate里面做地图注册操作
- 延后加载（懒加载），提升APP启动时间

### 第一个方案：通过宏定义（枚举）实现

切换地图引擎时只需要修改枚举类型

```bash
MapEngine *mapEngine = [[MapEngine alloc] init];
id<IMapFactory> factory = [mapEngine getFactory:MapTypeBaiduMap];
id<IMapView> mapView = [factory getMapView:self.view.frame];
[self.view addSubview:[mapView getView]];
```

### 第二个方案：配置文件（xml配置、josn配置文件等。。。）

切换地图引擎时只需要配置文件中的isOpen字段的值即可

```bash
<?xml version="1.0" encoding="UTF-8" ?>
<!--如何定义?-->
<!--map标签:表示地图-->
<map>
    
    <!--platform标签:表示平台(例如：百度SDK平台、高德SDK、GoogleSDK等等...)-->
    <!--appKey标签:表示注册Key)-->
    <!--factoryName标签:表示地图平台封装具体工厂类)-->
    <!--isOpen标签:表示是否开启当前这个地图(开关))-->
    <platform id="1" appKey="haZaPRO1c8zXbGUBw0jcMvIb9PjGScPN" factoryName="BaiduMapFactory" isOpen="YES"/>
    
    <platform id="2" appKey="481b343252a4f61ff7a5e206b952ce99" factoryName="GaodeMapFactory" isOpen="NO"/>
    
</map>
```

    
```bash
MapEngine *mapEngine = [[MapEngine alloc] init];
id<IMapFactory> factory = [mapEngine getFactory];
id<IMapView> mapView = [factory getMapView:self.view.frame];
[self.view addSubview:[mapView getView]];
```

### 以此Demo主要学习的是架构思想，你要是学的代码和功能那就亏咯

    
