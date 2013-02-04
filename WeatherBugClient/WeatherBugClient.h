//
//  WeatherBugClient.h
//
//  Created by Chris Chen on 27/01/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>
#import "WeatherBugLive.h"

typedef enum
{
    TemperatureUnitFahrenheit,
    TemperatureUnitCelsius
}TemperatureUnit;

@interface WeatherBugClient : AFHTTPClient
@property (nonatomic, strong) NSString *apiKey;
+ (CHYWeatherBugClient *)sharedClient;
- (void)liveWithLocation:(CLLocationCoordinate2D)location success:(void(^)(WeatherBugLive *weatherBugLive))success failure:(void(^)(NSError *error))failure;
- (void)liveWithLocation:(CLLocationCoordinate2D)location unit:(TemperatureUnit)unit success:(void(^)(WeatherBugLive *weatherBugLive))success failure:(void(^)(NSError *error))failure;
- (void)forecastWithLocation:(CLLocationCoordinate2D)location success:(void(^)(NSArray *forecasts))success failure:(void(^)(NSError *error))failure;
- (void)forecastWithLocation:(CLLocationCoordinate2D)location numberOfDays:(int)numberOfDays language:(NSString *)language unit:(TemperatureUnit)unit success:(void(^)(NSArray *forecasts))success failure:(void(^)(NSError *error))failure;
@end
