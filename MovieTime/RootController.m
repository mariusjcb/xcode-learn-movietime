//
//  RootViewController.m
//  MovieTime
//
//  Created by Marius Ilie on 03/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "RootController.h"
#import "RootView.h"

#import "IMDBMovieDataModel.h"
#import "IMDBManager.h"
#import "IMDBSearch.h"

@interface RootController () <IMDBManagerDelegate>
{
    NSArray *_movies;
    IMDBManager *_manager;
}

@end

@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initIMDBManager];

    [RootView initMainNavigationToolBarWithNavigationController:self.navigationController andNavigationItem:self.navigationItem];
    [RootView addBlurredBgToMainView:self.view];
    
    //[_manager fetchDatasByTitle:@"pirates+of+the"];
    //[_manager fetchActorsByMovie: [_movies objectAtIndex:0]];
}

- (void) initIMDBManager
{
    _manager = [[IMDBManager alloc] init];
    _manager.search = [[IMDBSearch alloc] init];
    _manager.search.delegate = _manager;
    _manager.delegate = self;
}

#pragma mark IMDBManagerDelegate

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveMovies:(NSArray *)movies
{
    _movies = movies;
}

- (void)didReceiveActorsProperty:(NSDictionary *)actors forMovie:(IMDBMovieDataModel *)movie
{
    [movie addActorsProperty:actors];
}

- (void)fetchingJSONFailedWithError:(NSError *)error
{
    NSLog(@"ERROR: %@", [error localizedDescription]);
}

@end
