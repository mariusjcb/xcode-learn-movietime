//
//  IMDBMovieDataModel.h
//  MovieTime
//
//  Created by Marius Ilie on 30/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "IMDBActorDataModel.h"
#include "IMDBTrailerDataModel.h"

@interface IMDBMovieDataModel : NSObject

@property (strong, nonatomic) NSString *idIMDB;
@property (strong, nonatomic) NSString *urlIMDB;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *originalTitle;
@property (strong, nonatomic) NSString *year;
@property (strong, nonatomic) NSString *releaseDate;
@property (strong, nonatomic) NSArray *directors;
@property (strong, nonatomic) NSArray *writers;
@property (strong, nonatomic) NSString *runtime;
@property (strong, nonatomic) NSString *urlPoster;
@property (strong, nonatomic) NSArray *countries;
@property (strong, nonatomic) NSArray *languages;
@property (strong, nonatomic) NSArray *genres;
@property (strong, nonatomic) NSString *plot;
@property (strong, nonatomic) NSString *simplePlot;
@property (strong, nonatomic) NSString *rating;
@property (strong, nonatomic) NSString *metascore;
@property (strong, nonatomic) NSArray *filmingLocations;
@property (strong, nonatomic) NSArray *keywords;
@property (strong, nonatomic) NSArray *quotes;
@property (strong, nonatomic) NSString *rated;
@property (strong, nonatomic) NSArray *votes;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) IMDBTrailerDataModel *trailer;
@property (strong, nonatomic) NSArray<IMDBActorDataModel *> *actors;

- (void) addActorsProperty:(NSArray<IMDBActorDataModel *> *)actors;

@end
