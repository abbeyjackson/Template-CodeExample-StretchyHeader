//
//  NewsItem.h
//  StretchMyHeader
//
//  Created by Abegael Jackson on 2015-06-09.
//  Copyright (c) 2015 Abegael Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NewsItem : NSObject

@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *headline;
@property (nonatomic, strong) UIColor *textColor;


-(instancetype)initWithCategory:(NSString*)category andHeadline:(NSString*)headline;

@end
