//
//  RootViewController.m
//  MovieTime
//
//  Created by Marius Ilie on 03/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "RootController.h"
#import "RootView.h"

@interface RootController () <MainNavigationDelegate>
{
    RootView *_mainView;
}

@end

@implementation RootController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initGraphics];
    
    //[_manager fetchDatasByTitle:@"pirates+of+the"];
    //[_manager fetchActorsByMovie: [_movies objectAtIndex:0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initGraphics
{
    _mainView = [[RootView alloc] init];
    _mainView.delegate = self;
    
    [_mainView initNavigationToolBarWithNavigationController:self.navigationController andNavigationItem:self.navigationItem];
    
    [RootView addBlurredBgToMainView:self.view];
}

#pragma mark MainNavigationDelegate

- (IBAction)didClickedAddBarButton:(id)sender
{
    SearchController *searchPage = [[SearchController alloc] initWithNibName:@"SearchView" bundle:nil];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:searchPage];
    
    [self.navigationController presentViewController:navigationController animated:YES completion:nil];
}

@end
