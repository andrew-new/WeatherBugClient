//
//  WeatherBugLive.h
//  Trax
//
//  Created by Chris Chen on 28/01/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherBugDefine.h"

@interface WeatherBugLive : NSObject

@property (nonatomic, readonly) NSString *currConditionDesc;
@property (nonatomic, readonly) NSString *currConditionIcon;
@property (nonatomic, readonly) WeatherCondition currCondition;
@property (nonatomic, readonly) NSNumber *humidity;
@property (nonatomic, readonly) NSNumber *pressure;
@property (nonatomic, readonly) NSNumber *temp;
@property (nonatomic, readonly) NSNumber *tempHigh;
@property (nonatomic, readonly) NSNumber *tempLow;
@property (nonatomic, readonly) NSNumber *windSpeed;
@property (nonatomic, readonly) NSString *windDirection;
@property (nonatomic, readonly) NSNumber *windDirectionDegrees;

- (id)initWithXMLDictionary:(NSDictionary *)dictionary;
@end
