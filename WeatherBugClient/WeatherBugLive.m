//
//  WeatherBugLive.m
//  Trax
//
//  Created by Chris Chen on 28/01/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import "WeatherBugLive.h"
#import "NSString+WeatherCondition.h"

@implementation WeatherBugLive
- (id)initWithXMLDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        NSDictionary *channel = dictionary[@"channel"];
        if (channel) {
            NSDictionary *aws_ob = channel[@"aws:weather"][@"aws:ob"];
            if (aws_ob) {
                _currConditionDesc = aws_ob[@"aws:current-condition"][@"__text"];
                _currConditionIcon = aws_ob[@"aws:current-condition"][@"_icon"];
                _currCondition = [_currConditionDesc weatherCondition];
                
                _windDirection = aws_ob[@"aws:wind-direction"];
                _windDirectionDegrees = aws_ob[@"aws:wind-direction-degrees"];
                _windSpeed = aws_ob[@"aws:wind-speed"][@"__text"];
                
                NSDictionary *aws_humidity = aws_ob[@"aws:humidity"];
                if (aws_humidity) {
                    _humidity = aws_humidity[@"__text"];
                }
                
                NSDictionary *aws_pressure = aws_ob[@"aws:pressure"];
                if (aws_pressure) {
                    _pressure = aws_pressure[@"__text"];
                }
                
                NSDictionary *aws_temp = aws_ob[@"aws:temp"];
                if (aws_temp) {
                    _temp = aws_temp[@"__text"];
                }
                
                NSDictionary *aws_tempHigh = aws_ob[@"aws:temp-high"];
                if (aws_tempHigh) {
                    _tempHigh = aws_tempHigh[@"__text"];
                }
                
                NSDictionary *aws_tempLow = aws_ob[@"aws:temp-low"];
                if (aws_tempLow) {
                    _tempLow = aws_tempLow[@"__text"];
                }
            }
        }
    }
    
    return self;
}

@end
