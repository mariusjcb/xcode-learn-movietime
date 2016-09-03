//
//  RootView.h
//  InMovies
//
//  Created by Marius Ilie on 03/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootView : UIViewController

+ (void)initMainNavigationToolBarWithNavigationController:(UINavigationController *)navController andNavigationItem:(UINavigationItem *)navItem;
+ (void)addBlurredBgToMainView:(UIView *)view;

@end
