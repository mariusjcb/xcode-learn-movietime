//
//  SearchView.m
//  InMovies
//
//  Created by Marius Ilie on 04/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView


- (void) callCloseButtonDelegate:(id)sender
{
    [self.delegate didClickedCloseBarButton:sender];
}

- (id)initNavigationToolBarWithNavigationController:(UINavigationController *)navController andNavigationItem:(UINavigationItem *)navItem andSearchBar:(UISearchBar *)searchBar
{
    [navController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    navController.navigationBar.translucent = YES;
    
    UIBarButtonItem *closeModalButton = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed:@"circle-x-7"] style:UIBarButtonItemStylePlain target:self action:@selector(callCloseButtonDelegate:)];
    closeModalButton.tintColor = [UIColor whiteColor];
    
    [navItem setLeftBarButtonItem:closeModalButton];
    
    long leftPos = [[closeModalButton valueForKey:@"view"] frame].size.width + 5;
    long width = navController.navigationBar.bounds.size.width - leftPos - 15;
    long height = navController.navigationBar.bounds.size.height/2;
    
    [searchBar setFrame:CGRectMake(leftPos,10,width,height)];
    searchBar.placeholder = @"Type movie title...";
    
    [navController.navigationBar addSubview:searchBar];
    
    return (id)searchBar;
}

- (void)addActivityIndicator
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.backgroundColor = [UIColor colorWithRed:0.9f green:0.93f blue:0.93f alpha:0.93f];
    
    self.controller.refreshControl = refreshControl;
    
    [self.controller.refreshControl beginRefreshing];
}

- (void)removeActivityIndicator
{
    [self.controller.refreshControl endRefreshing];
    self.controller.refreshControl = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
