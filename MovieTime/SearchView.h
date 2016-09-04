//
//  SearchView.h
//  InMovies
//
//  Created by Marius Ilie on 04/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "+NavigationDelegates.h"

@interface SearchView : UITableView

@property (nonatomic, weak) id<SearchNavigationDelegate, UITableViewDelegate> delegate;
@property (nonatomic, strong) UIActivityIndicatorView *loadDataMonitor;
@property (nonatomic, assign) CGPoint offset;

- (id)initNavigationToolBarWithNavigationController:(UINavigationController *)navController andNavigationItem:(UINavigationItem *)navItem andSearchBar:(UISearchBar *)searchBar;

- (void)addActivityIndicator;
- (void)removeActivityIndicator;

@property (nonatomic, strong) UITableViewController<UISearchBarDelegate> *controller;

@end
