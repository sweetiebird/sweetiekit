//
//  NUITableViewDataSource.m
//  node-ios-hello
//
//  Created by Emily Kolar on 4/22/19.
//  Copyright © 2019 sweetiebird. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#include "defines.h"

#import "NUITableViewDataSource.h"


@implementation SUITableViewDataSource

//@property (nonatomic, strong) IBOutlet iCarousel *carousel;

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  return [UITableViewCell alloc];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 0;
}

@end

