//
//  +IMDBManagerDelegate.h
//  MovieTime
//
//  Created by Marius Ilie on 01/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMDBManagerDelegate <NSObject>

- (void)didReceiveMovies:(NSArray *)movies;
- (void)didReceiveActorsProperty:(NSDictionary *)actors forImdbID:(NSString *)imdbID;
- (void)fetchingJSONFailedWithError:(NSError *)error;

@end
