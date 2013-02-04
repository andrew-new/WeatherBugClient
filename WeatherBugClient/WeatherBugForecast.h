//
//  WeatherBugForecast.h
//  Trax
//
//  Created by Chris Chen on 28/01/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherBugDefine.h"

@interface WeatherBugForecast : NSObject
@property (nonatomic, readonly) NSString *dayTitle;
@property (nonatomic, readonly) NSString *dayDesc;
@property (nonatomic, readonly) NSString *dayIcon;
@property (nonatomic, readonly) NSString *dayPred;
@property (nonatomic, readonly) WeatherCondition dayCondition;
@property (nonatomic, readonly) NSString *nightDesc;
@property (nonatomic, readonly) NSString *nightIcon;
@property (nonatomic, readonly) NSString *nightPred;
@property (nonatomic, readonly) WeatherCondition nightCondition;
@property (nonatomic, readonly) NSNumber *high;
@property (nonatomic, readonly) NSNumber *low;

- (id)initWithJSONDictionary:(NSDictionary *)dictionary;

@end
