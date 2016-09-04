//
//  NavigationDelegate.h
//  InMovies
//
//  Created by Marius Ilie on 04/09/2016.
//  Copyright © 2016 Marius Ilie. All rights reserved.
//

#import <Foundation/Foundation.h>

// Nav Controllers
#import "SearchController.h"

@protocol MainNavigationDelegate <NSObject>

- (IBAction)didClickedAddBarButton:(id)sender;

@end

@protocol SearchNavigationDelegate <NSObject>

- (IBAction)didClickedCloseBarButton:(id)sender;

@end
