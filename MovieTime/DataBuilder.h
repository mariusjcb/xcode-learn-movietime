//
//  DataBuilder.h
//  MovieTime
//
//  Created by Marius Ilie on 31/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBuilder : NSObject

+ (NSArray *)parseJSONFromData:(NSData *)data error:(NSError **)error;
+ (NSDictionary *)parseActorJSONFromData:(NSData *)data error:(NSError **)error;

@end
