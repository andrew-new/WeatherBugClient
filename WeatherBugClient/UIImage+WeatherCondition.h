//
//  UIImage+WeatherCondition.h
//  Trax
//
//  Created by Chris Chen on 4/02/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherBugDefine.h"

@interface UIImage (WeatherCondition)
+ (UIImage *)imageWithWeatherCondition:(WeatherCondition)weatherCondition dayTime:(BOOL)dayTime;
@end
