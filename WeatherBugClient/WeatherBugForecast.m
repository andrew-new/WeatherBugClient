//
//  WeatherBugForecast.m
//  Trax
//
//  Created by Chris Chen on 28/01/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import "WeatherBugForecast.h"
#import "NSString+WeatherCondition.h"

@implementation WeatherBugForecast
- (id)initWithJSONDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        _dayTitle = dictionary[@"dayTitle"];
        _dayDesc = dictionary[@"dayDesc"];
        _dayIcon = dictionary[@"dayIcon"];
        _dayPred = dictionary[@"dayPred"];
        _dayCondition = [_dayDesc weatherCondition];
        _nightDesc = dictionary[@"nightDesc"];
        _nightIcon = dictionary[@"nightIcon"];
        _nightPred = dictionary[@"nightPred"];
        _nightCondition = [_nightDesc weatherCondition];
        _low = dictionary[@"low"];
        _high = dictionary[@"high"];
    }
    
    return self;
}

@end
