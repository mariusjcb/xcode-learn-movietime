//
//  SearchController.m
//  InMovies
//
//  Created by Marius Ilie on 04/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "SearchController.h"
#import "SearchView.h"
#import "SearchTableViewCell.h"

#import "IMDBMovieDataModel.h"
#import "IMDBManager.h"
#import "IMDBSearch.h"

@interface SearchController () <IMDBManagerDelegate, SearchNavigationDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSArray *_movies;
    IMDBManager *_manager;
    
    SearchView *_searchView;
    IBOutlet UISearchBar *_searchBar;
}

@end

@implementation SearchController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initIMDBManager];
    [self initGraphics];
}

- (void) initIMDBManager
{
    _manager = [[IMDBManager alloc] init];
    _manager.search = [[IMDBSearch alloc] init];
    _manager.search.delegate = _manager;
    _manager.delegate = self;
}

- (void) initGraphics
{
    _searchView = [[SearchView alloc] init];
    _searchView.delegate = self;
    _searchView.controller = self;
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.delegate = self;
    
    _searchBar = (UISearchBar *)[_searchView initNavigationToolBarWithNavigationController:self.navigationController andNavigationItem:self.navigationItem andSearchBar:_searchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    _movies = nil;
    [self.tableView reloadData];
    
    [searchBar resignFirstResponder];
    
    [_searchView addActivityIndicator];
    [_manager fetchDatasByTitle:searchBar.text];
}

#pragma mark SearchNavigationDelegate

- (IBAction)didClickedCloseBarButton:(id)sender
{
    [_searchBar resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark IMDBManagerDelegate

- (void)didReceiveMovies:(NSArray *)movies
{
    _movies = movies;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [_searchView removeActivityIndicator];
        [self.tableView reloadData];
    });
}

- (void)didReceiveActorsProperty:(NSDictionary *)actors forMovie:(IMDBMovieDataModel *)movie
{
    [movie addActorsProperty:actors];
}

- (void)fetchingJSONFailedWithError:(NSError *)error
{
    NSLog(@"ERROR: %@", [error localizedDescription]);
}

#pragma mark UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_movies count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SearchTableViewCell";
    
    SearchTableViewCell *cell = (SearchTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SearchTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[_movies objectAtIndex:indexPath.row] valueForKey:@"urlPoster"]]];
    cell.thumbnailImageView.image = [UIImage imageWithData:imageData];
    
    cell.titleLabel.text = [[_movies objectAtIndex:indexPath.row] valueForKey:@"title"];
    cell.yearLabel.text = [NSString stringWithFormat:@"Year: %@ | %@", [[_movies objectAtIndex:indexPath.row] valueForKey:@"year"], [[_movies objectAtIndex:indexPath.row] valueForKey:@"type"]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
