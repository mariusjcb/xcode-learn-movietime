//
//  DataBuilder.m
//  MovieTime
//
//  Created by Marius Ilie on 31/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "DataBuilder.h"
#import "IMDBSearch.h"

@implementation DataBuilder

+ (NSArray *)parseJSONFromData:(NSData *)data error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    if (localError != nil)
    {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    NSArray *results = [[parsedObject valueForKey:@"data"] valueForKey:@"movies"];
    
    for (NSDictionary *movieResult in results)
    {
        IMDBMovieDataModel *movieObj = [[IMDBMovieDataModel alloc] init];
        
        for (NSString *key in movieResult)
            if ([movieObj respondsToSelector:NSSelectorFromString(key)])
                [movieObj setValue:[movieResult valueForKey:key] forKey:key];
        
        [movies addObject:movieObj];
    }
    
    return movies;
}

@end