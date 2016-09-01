//
//  ViewController.m
//  MovieTime
//
//  Created by Marius Ilie on 30/08/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "ViewController.h"

#import "IMDBMovieDataModel.h"
#import "IMDBManager.h"
#import "IMDBSearch.h"

@interface ViewController () <IMDBManagerDelegate>
{
    NSArray *_movies;
    IMDBManager *_manager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _manager = [[IMDBManager alloc] init];
    _manager.search = [[IMDBSearch alloc] init];
    _manager.search.delegate = _manager;
    _manager.delegate = self;
    
    [_manager fetchDatasByTitle:@"pirates+of+the"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startFetchingGroups:(NSNotification *)notification
{
    [_manager fetchDatasByTitle:@"pirates+of+the"];
}

- (void)didReceiveMovies:(NSArray *)movies
{
    _movies = movies;
}

- (void)fetchingJSONFailedWithError:(NSError *)error
{
    NSLog(@"ERROR: %@", [error localizedDescription]);
}

@end
