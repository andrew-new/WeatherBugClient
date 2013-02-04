//
//  WeatherBugClient.m
//  Trax
//
//  Created by Chris Chen on 27/01/13.
//  Copyright (c) 2013 e-Centric Marketing. All rights reserved.
//

#import "WeatherBugClient.h"
#import "WeatherBugForecast.h"
#import "JSONKit.h"
#import "XMLDictionary.h"

static NSString * const kAPIBaseURLString = @"http://i.wxbug.net/REST/";

@implementation WeatherBugClient
+ (WeatherBugClient *)sharedClient
{
    static WeatherBugClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[WeatherBugClient alloc] initWithBaseURL:[NSURL URLWithString:kAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (void)liveWithLocation:(CLLocationCoordinate2D)location success:(void(^)(WeatherBugLive *weatherBugLive))success failure:(void(^)(NSError *error))failure
{
    [self liveWithLocation:location unit:TemperatureUnitCelsius success:success failure:failure];
}
- (void)liveWithLocation:(CLLocationCoordinate2D)location unit:(TemperatureUnit)unit success:(void(^)(WeatherBugLive *weatherBugLive))success failure:(void(^)(NSError *error))failure
{
    if (self.apiKey.length == 0)
    {
        if (failure)
        {
            NSError *error = [NSError errorWithDomain:@"au.com.trax" code:0 userInfo:@{NSLocalizedDescriptionKey : @"Must define WeatherBug API key!"}];
            failure(error);
        }
        
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"lat"] = @(location.latitude);
    params[@"long"] = @(location.longitude);
    params[@"UnitType"] = @(unit);
    params[@"api_key"] = self.apiKey;
    
    [self getPath:@"SP/getLiveWeatherRSS.aspx"
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              NSDictionary *xmlDictionary = [NSDictionary dictionaryWithXMLData:responseObject];
              if (xmlDictionary)
              {
                  if (success)
                  {
                      WeatherBugLive *live = [[WeatherBugLive alloc] initWithXMLDictionary:xmlDictionary];
                      success(live);
                  }
              }
              else
              {
                  if (failure)
                  {
                      NSError *error = [NSError errorWithDomain:@"au.com.trax" code:0 userInfo:@{NSLocalizedDescriptionKey : @"Wrong XML format"}];
                      failure(error);
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure)
              {
                  failure(error);
              }
          }];    
}

- (void)forecastWithLocation:(CLLocationCoordinate2D)location success:(void(^)(NSArray *forecasts))success failure:(void(^)(NSError *error))failure
{
    [self forecastWithLocation:location numberOfDays:4 language:@"en" unit:TemperatureUnitCelsius success:success failure:failure];
}

- (void)forecastWithLocation:(CLLocationCoordinate2D)location numberOfDays:(int)numberOfDays language:(NSString *)language unit:(TemperatureUnit)unit success:(void(^)(NSArray *forecasts))success failure:(void(^)(NSError *error))failure
{
    if (self.apiKey.length == 0)
    {
        if (failure)
        {
            NSError *error = [NSError errorWithDomain:@"au.com.trax" code:0 userInfo:@{NSLocalizedDescriptionKey : @"Must define WeatherBug API key!"}];
            failure(error);
        }
        
        return;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"la"] = @(location.latitude);
    params[@"lo"] = @(location.longitude);
    params[@"nf"] = @(numberOfDays);
    params[@"l"] = language;
    params[@"units"] = @(unit);
    params[@"api_key"] = self.apiKey;
    
    [self getPath:@"Direct/GetForecast.ashx"
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              id jsonObject = [responseObject objectFromJSONData];
              if ([jsonObject isKindOfClass:[NSDictionary class]])
              {
                  if (success)
                  {
                      NSMutableArray *forecasts = [NSMutableArray array];
                      for (NSDictionary *forecastDict in jsonObject[@"forecastList"])
                      {
                          WeatherBugForecast *forecast = [[WeatherBugForecast alloc] initWithJSONDictionary:forecastDict];
                          if (forecast)
                          {
                              [forecasts addObject:forecast];
                          }
                      }
                      
                      success(forecasts);
                  }
              }
              else
              {
                  if (failure)
                  {
                      NSError *error = [NSError errorWithDomain:@"au.com.trax" code:0 userInfo:@{NSLocalizedDescriptionKey : @"Wrong JSON format"}];
                      failure(error);
                  }
              }
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              if (failure)
              {
                  failure(error);
              }
          }];
}

@end
