//
//  UIImage+WeatherCondition.m
//  Trax
//
//  Created by Chris Chen on 4/02/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import "UIImage+WeatherCondition.h"

@implementation UIImage (WeatherCondition)
+ (UIImage *)imageWithWeatherCondition:(WeatherCondition)weatherCondition dayTime:(BOOL)dayTime
{
    switch (weatherCondition) {
        case kWeatherConditionClear:
            return [UIImage imageNamed:dayTime ? @"clear.png" : @"clear_night.png"];

        case kWeatherConditionFog:
            return [UIImage imageNamed:@"fog.png"];

        case kWeatherConditionHail:
            return [UIImage imageNamed:@"hail.png"];

        case kWeatherConditionHaze:
            return [UIImage imageNamed:@""];

        case kWeatherConditionMostlyCloudy:
            return [UIImage imageNamed:dayTime ? @"mostlycloudy.png" : @"mostlycloudy_night.png"];

        case kWeatherConditionOvercast:
            return [UIImage imageNamed:@"overcast.png"];

        case kWeatherConditionPartlyCloudy:
            return [UIImage imageNamed:dayTime ?  @"partlycloudy.png" : @"partlycloudy_night.png"];

        case kWeatherConditionRain:
            return [UIImage imageNamed:dayTime ? @"rain.png" : @"rain_night.png"];

        case kWeatherConditionSnow:
            return [UIImage imageNamed:dayTime ? @"snow.png" : @"snow_night.png"];

        case kWeatherConditionThunderstorm:
            return [UIImage imageNamed:dayTime ? @"thunderstorm.png" : @"thunderstorm_night.png"];

        case kWeatherConditionWind:
            return [UIImage imageNamed:@"wind.png"];

        default:
            return [UIImage imageNamed:@"na.png"];
    }
}
@end
