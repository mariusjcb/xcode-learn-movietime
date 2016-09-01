//
//  IMDBManager.m
//  MovieTime
//
//  Created by Marius Ilie on 01/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "IMDBManager.h"
#import "DataBuilder.h"

@implementation IMDBManager

- (void)fetchDatasByTitle:(NSString *)title
{
    [self.search searchDatasByTitle:title];
}

#pragma mark - IMDBSearchDelegate

- (void)receivedJSONWithData:(NSData *)jsonObject
{
    NSError *error = nil;
    NSArray *movies = [DataBuilder parseJSONFromData:jsonObject error:&error];
    
    if (error != nil)
        [self.delegate fetchingJSONFailedWithError:error];
    else [self.delegate didReceiveMovies:movies];
}

- (void)fetchingJSONFailedWithError:(NSError *)error
{
    [self.delegate fetchingJSONFailedWithError:error];
}

@end
