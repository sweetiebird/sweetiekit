// https://gist.github.com/hmcfletch/1661029#file-colorhelper-h

#include "ColorHelper.h"

@implementation ColorHelper

+ (UIImage *)imageFromColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;
}

+ (CAGradientLayer *)gradientWithFrame:(CGRect)frame fromColor:(UIColor *)topColor toColor:(UIColor *)bottomColor
{
    CAGradientLayer *shadowGradient = [CAGradientLayer layer];
    shadowGradient.frame = frame;
    shadowGradient.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], (id)[bottomColor CGColor], nil];
    return shadowGradient;
}

+ (UIColor *)darkenColor:(UIColor *)oldColor percentOfOriginal:(float)amount
{
    float  percentage      = amount / 100.0;
    size_t totalComponents = CGColorGetNumberOfComponents(oldColor.CGColor);
    bool   isGreyscale     = totalComponents == 2 ? YES : NO;
  
    CGFloat* oldComponents = (CGFloat *)CGColorGetComponents(oldColor.CGColor);
    CGFloat newComponents[4];
  
    if (isGreyscale) {
        newComponents[0] = oldComponents[0]*percentage;
        newComponents[1] = oldComponents[0]*percentage;
        newComponents[2] = oldComponents[0]*percentage;
        newComponents[3] = oldComponents[1];
    } else {
        newComponents[0] = oldComponents[0]*percentage;
        newComponents[1] = oldComponents[1]*percentage;
        newComponents[2] = oldComponents[2]*percentage;
        newComponents[3] = oldComponents[3];
    }
  
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
    CGColorSpaceRelease(colorSpace);
  
    UIColor *retColor = [UIColor colorWithCGColor:newColor];
    CGColorRelease(newColor);
  
    return retColor;
}

+ (UIColor *)lightenColor:(UIColor *)oldColor byPercentage:(float)amount
{
    float  percentage      = amount / 100.0;
    size_t totalComponents = CGColorGetNumberOfComponents(oldColor.CGColor);
    bool   isGreyscale     = totalComponents == 2 ? YES : NO;
  
    CGFloat* oldComponents = (CGFloat *)CGColorGetComponents(oldColor.CGColor);
    CGFloat newComponents[4];
  
    if (isGreyscale) {
        newComponents[0] = oldComponents[0]*percentage + oldComponents[0] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[0];
        newComponents[1] = oldComponents[0]*percentage + oldComponents[0] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[0];
        newComponents[2] = oldComponents[0]*percentage + oldComponents[0] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[0];
        newComponents[3] = oldComponents[0]*percentage + oldComponents[1] > 1.0 ? 1.0 : oldComponents[1]*percentage + oldComponents[1];
    } else {
        newComponents[0] = oldComponents[0]*percentage + oldComponents[0] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[0];
        newComponents[1] = oldComponents[1]*percentage + oldComponents[1] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[1];
        newComponents[2] = oldComponents[2]*percentage + oldComponents[2] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[2];
        newComponents[3] = oldComponents[3]*percentage + oldComponents[3] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[3];
    }
  
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
    CGColorSpaceRelease(colorSpace);
  
    UIColor *retColor = [UIColor colorWithCGColor:newColor];
    CGColorRelease(newColor);
  
    return retColor;
}

+ (UIColor *)CGColorToUIColor:(CGColor *)color
{
    size_t totalComponents = CGColorGetNumberOfComponents(color);
    bool   isGreyscale     = totalComponents == 2 ? YES : NO;
    float  percentage = 1.0f;
  
    CGFloat* oldComponents = (CGFloat *)CGColorGetComponents(color);
    CGFloat newComponents[4];
  
    if (isGreyscale) {
        newComponents[0] = oldComponents[0]*percentage + oldComponents[0] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[0];
        newComponents[1] = oldComponents[0]*percentage + oldComponents[0] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[0];
        newComponents[2] = oldComponents[0]*percentage + oldComponents[0] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[0];
        newComponents[3] = oldComponents[0]*percentage + oldComponents[1] > 1.0 ? 1.0 : oldComponents[1]*percentage + oldComponents[1];
    } else {
        newComponents[0] = oldComponents[0]*percentage + oldComponents[0] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[0];
        newComponents[1] = oldComponents[1]*percentage + oldComponents[1] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[1];
        newComponents[2] = oldComponents[2]*percentage + oldComponents[2] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[2];
        newComponents[3] = oldComponents[3]*percentage + oldComponents[3] > 1.0 ? 1.0 : oldComponents[0]*percentage + oldComponents[3];
    }
  
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
    CGColorSpaceRelease(colorSpace);
  
    UIColor *retColor = [UIColor colorWithCGColor:newColor];
    CGColorRelease(newColor);
  
    return retColor;
}

+ (CGColorRef)UIColorToCGColor:(UIColor *)color
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat newComponents[4];
    [color getRed:&newComponents[0] green:&newComponents[1] blue:&newComponents[2] alpha:&newComponents[3]];
    CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
    CGColorSpaceRelease(colorSpace);
  
    return newColor;
}

@end
