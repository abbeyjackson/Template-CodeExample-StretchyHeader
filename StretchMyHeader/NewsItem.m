//
//  NewsItem.m
//  StretchMyHeader
//
//  Created by Abegael Jackson on 2015-06-09.
//  Copyright (c) 2015 Abegael Jackson. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem



-(instancetype)initWithCategory:(NSString*)category andHeadline:(NSString*)headline{
    self = [super init];
    if (self) {
        _category = category;
        _headline = headline;
        [self getTextColor];
    }
    return self;
}


-(void)getTextColor{
    if ([self.category isEqualToString:@"World"]) {
        self.textColor = [UIColor redColor];
    }
    if ([self.category isEqualToString:@"Americas"]) {
        self.textColor = [UIColor blueColor];
    }
    if ([self.category isEqualToString:@"Europe"]) {
        self.textColor = [UIColor greenColor];
    }
    if ([self.category isEqualToString:@"Middle East"]) {
        self.textColor = [UIColor cyanColor];
    }
    if ([self.category isEqualToString:@"Africa"]) {
        self.textColor = [UIColor orangeColor];
    }
    if ([self.category isEqualToString:@"Asia Pacific"]) {
        self.textColor = [UIColor purpleColor];
    }
}

@end
