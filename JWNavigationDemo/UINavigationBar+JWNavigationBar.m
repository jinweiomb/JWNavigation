//
//  UINavigationBar+JWNavigationBar.m
//  JWNavigationDemo
//
//  Created by szgw on 16/5/24.
//  Copyright © 2016年 JINWEI. All rights reserved.
//

#import "UINavigationBar+JWNavigationBar.h"

@implementation UINavigationBar (JWNavigationBar)

- (void)jwInitBackgroundColor:(UIColor *)backgroundColor Alpha:(float)alpha{

    
    [self setBackgroundImage:[self createImageWithColor:[backgroundColor colorWithAlphaComponent:alpha]]
     
                             forBarMetrics:UIBarMetricsDefault];
    
    self.shadowImage = [UIImage new];
    
    self.translucent = YES;
}
- (void)jwSetBackgroundColor:(UIColor *)backgroundColor Alpha:(float)alpha{
    [self setBackgroundImage:[self createImageWithColor:[backgroundColor colorWithAlphaComponent:alpha]]
     
               forBarMetrics:UIBarMetricsDefault];

}
- (void)jwReset{
    [self setBackgroundImage:nil
     
               forBarMetrics:UIBarMetricsDefault];

}


-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
