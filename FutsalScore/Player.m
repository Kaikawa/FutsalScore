//
//  Player.m
//  FutsalScore
//
//  Created by 相川　耕佑 on 2015/10/07.
//  Copyright © 2015年 aikawa. All rights reserved.
//

#import "Player.h"

@implementation Player

// Specify default values for properties

+ (NSDictionary *)defaultPropertyValues
{
    return @{@"goal" : @0,@"assist" : @0,@"shoot" : @0};
}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

+ (NSString *)primaryKey {
    return  @"id";
}

@end
