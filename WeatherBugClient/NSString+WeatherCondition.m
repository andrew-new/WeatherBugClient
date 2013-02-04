//
//  NSString+WeatherCondition.m
//  Trax
//
//  Created by Chris Chen on 3/02/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import "NSString+WeatherCondition.h"

@implementation NSString (WeatherCondition)
- (WeatherCondition)weatherCondition{
    WeatherCondition returnValue = kWeatherConditionNA;
    
    NSString *lowerDesc = [self lowercaseString];
    
    if ([lowerDesc rangeOfString:@"sunny"].location != NSNotFound ||
        [lowerDesc rangeOfString:@"fine"].location != NSNotFound ||
        [lowerDesc rangeOfString:@"clear"].location != NSNotFound) {
        returnValue = kWeatherConditionClear;
    }
    else if ([lowerDesc rangeOfString:@"rain"].location != NSNotFound) {
        returnValue = kWeatherConditionRain;
    }
    else if ([lowerDesc rangeOfString:@"haze"].location != NSNotFound ||
        [lowerDesc rangeOfString:@"hazy"].location != NSNotFound) {
        returnValue = kWeatherConditionHaze;
    }
    else if ([lowerDesc rangeOfString:@"partly"].location != NSNotFound ||
        [lowerDesc rangeOfString:@"cloud"].location != NSNotFound) {
        returnValue = kWeatherConditionPartlyCloudy;
    }
    else if ([lowerDesc rangeOfString:@"mostly"].location != NSNotFound &&
        ! [lowerDesc rangeOfString:@"clear"].location != NSNotFound) {
        returnValue = kWeatherConditionMostlyCloudy;
    }
    else if ([lowerDesc rangeOfString:@"overcast"].location != NSNotFound) {
        returnValue = kWeatherConditionOvercast;
    }
    else if ([lowerDesc rangeOfString:@"fog"].location != NSNotFound) {
        returnValue = kWeatherConditionFog;
    }
    else if ([lowerDesc rangeOfString:@"thunderstorm"].location != NSNotFound) {
        returnValue = kWeatherConditionThunderstorm;
    }
    else if ([lowerDesc rangeOfString:@"snow"].location != NSNotFound ||
        [lowerDesc rangeOfString:@"flur"].location != NSNotFound) {
        returnValue = kWeatherConditionSnow;
    }
    else if ([lowerDesc rangeOfString:@"hail"].location != NSNotFound ||
        [lowerDesc rangeOfString:@"sleet"].location != NSNotFound) {
        returnValue = kWeatherConditionHail;
    }
    else if ([lowerDesc rangeOfString:@"wind"].location != NSNotFound) {
        returnValue = kWeatherConditionWind;
    }
    
    return returnValue;
}

@end
