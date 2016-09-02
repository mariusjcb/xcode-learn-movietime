//
//  IMDBManager.h
//  MovieTime
//
//  Created by Marius Ilie on 01/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "+IMDBManagerDelegate.h"
#import "+IMDBSearchDelegate.h"

#import "IMDBSearch.h"

@interface IMDBManager : NSObject <IMDBSearchDelegate>

@property (nonatomic, strong) IMDBSearch *search;
@property (nonatomic, weak) id<IMDBManagerDelegate> delegate;

- (void)fetchDatasByTitle:(NSString *)title;
- (void)fetchActorsByImdbID:(NSString *)imdbID;

+ (int)getIndexMovieByimdbID:(NSString *)imdbID fromArray:(NSArray *)moviesArray;

@end
