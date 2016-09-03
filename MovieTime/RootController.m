//
//  RootViewController.m
//  MovieTime
//
//  Created by Marius Ilie on 03/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "RootController.h"

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
    [self.view setBackgroundColor: [UIColor colorWithRed:0.14f green:0.14f blue:0.14f alpha:1.0f]];
    
    _manager = [[IMDBManager alloc] init];
    _manager.search = [[IMDBSearch alloc] init];
    _manager.search.delegate = _manager;
    _manager.delegate = self;
    
    
    [RootView initMainNavigationToolBarWithNavigationController:self.navigationController andNavigationItem:self.navigationItem];
    
    //[_manager fetchDatasByTitle:@"pirates+of+the"];
    //[_manager fetchActorsByMovie: [_movies objectAtIndex:0]];
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
