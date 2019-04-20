
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

// generate a UIColor from rgb and alpha values
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r, g, b) RGBA(r, g, b, 1.0)
// generate a UIColor
#define GRAYSCALEA(rgb, a) RGBA(rgb, rgb, rgb, a)
#define GRAYSCALE(rgb) GRAYSCALEA(rgb, 1.0)
// generate a UIColor from a hex and an alpha value
#define HEXCOLORA(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:a]
#define HEXCOLOR(rgbValue) HEXCOLORA(rgbValue, 1.0)

@interface ColorHelper : NSObject

// UImage of a solid color and size. Good for placeholders.
+ (UIImage *)imageFromColor:(UIColor *)color andSize:(CGSize)size;
// vertical linear gradient at the given frame from topColor to bottomColor
+ (CAGradientLayer *)gradientWithFrame:(CGRect)frame fromColor:(UIColor *)topColor toColor:(UIColor *)bottomColor;
// darkens a UIColor by a given amount
+ (UIColor *)darkenColor:(UIColor *)oldColor percentOfOriginal:(float)amount;
// lightens a UIColor by a given amount
+ (UIColor *)lightenColor:(UIColor *)oldColor byPercentage:(float)amount;

+ (UIColor *)CGColorToUIColor:(CGColor *)color;

@end
