//
//  RootView.m
//  InMovies
//
//  Created by Marius Ilie on 03/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import "RootView.h"

@interface RootView ()

@end

@implementation RootView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)initMainNavigationToolBarWithNavigationController:(UINavigationController *)navController andNavigationItem:(UINavigationItem *)navItem
{
    [navController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    navController.navigationBar.topItem.title = @"InMovies";
    
    UIBarButtonItem *addNewMovieButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    addNewMovieButton.tintColor = [UIColor whiteColor];
    [navItem setRightBarButtonItem:addNewMovieButton];
    
    UIBarButtonItem *openMenuButton = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed:@"list-fat-7"] style:UIBarButtonItemStylePlain target:self action:nil];
    openMenuButton.tintColor = [UIColor whiteColor];
    
    [navItem setLeftBarButtonItem:openMenuButton];
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
