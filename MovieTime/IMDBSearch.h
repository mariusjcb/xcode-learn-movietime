//
//  IMDBMovies.h
//  MovieTime
//
//  Created by Marius Ilie on 31/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMDBMovieDataModel.h"

@protocol IMDBSearchDelegate;


@interface IMDBSearch : NSObject

@property (nonatomic, weak) id<IMDBSearchDelegate> delegate;

- (void)searchDatasByTitle:(NSString *)title;

@end
