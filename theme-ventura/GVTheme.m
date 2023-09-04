#import "GVTheme.h"
#import "GVThemeColors.h"
#import "MethodSwizzling.h"

@implementation GVTheme

static NSColor *_accentColor;
static NSColor *_supportColor;
static NSColor *_supportColorRelief;
static GVTheme *_sharedInstance;

+ (GVTheme *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

+ (void)initialize {
    if (self == [GVTheme class]) {
        [self sharedInstance];
    }
}

- (instancetype)init {
    self = [super init];
    if (self) {
        // Variables used by shared instance must be retained
        _accentColor = [GVThemeColorRGB(53, 120, 247, 1.0) retain];
        _supportColor = [GVThemeColorRGB(233, 228, 224, 1.0) retain];
        _supportColorRelief = [GVThemeColorRGB(226, 221, 217, 1.0) retain];
    }
    return self;
}

+ (NSColor *)accentColor {
    return _accentColor;
}

+ (void)setAccentColor:(NSColor *)accentColor {
    if (_accentColor != accentColor) {
        [_accentColor release];
        _accentColor = [accentColor retain];
    }
}

+ (NSColor *)supportColor {
    return _supportColor;
}

+ (void)setSupportColor:(NSColor *)supportColor {
    if (_supportColor != supportColor) {
        [_supportColor release];
        _supportColor = [supportColor retain];
    }
}

+ (NSColor *)supportColorRelief {
    return _supportColorRelief;
}

+ (void)setSupportColorRelief:(NSColor *)supportColorRelief {
    if (_supportColorRelief != supportColorRelief) {
        [_supportColorRelief release];
        _supportColorRelief = [supportColorRelief retain];
    }
}

- (void)dealloc {
    // Retained variables must be released
    [_accentColor release];
    [_supportColor release];
    [_supportColorRelief release];
    [super dealloc];
}

- (void)activate
{
    [super activate];
    [self loadColorsFromConfigPlist];
}

- (NSColorList*) colors
{
    return GVThemeColorList(); 
}

- (void)loadColorsFromConfigPlist {

    NSArray *roots = @[
        NSHomeDirectory(),
        NSOpenStepRootDirectory(),
        NSTemporaryDirectory(),
        NSHomeDirectory()
    ];

    NSString *plistPath = nil;

    for (NSString *root in roots) {
        NSString *themesPath = [root stringByAppendingPathComponent:@"GNUstep/Library/Themes"];
        NSString *themePath = [themesPath stringByAppendingPathComponent:@"Ventura.theme"];
        NSString *potentialPlistPath = [themePath stringByAppendingPathComponent:@"Resources/config.plist"];
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:potentialPlistPath]) {
            plistPath = potentialPlistPath;
            break;
        }
    }

    if (plistPath) {
        NSDictionary *plistData = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSColor *accentColor = GVColorForAccentColorName(plistData[@"GVThemeAccentColor"]);
        if (accentColor) {
            [GVTheme setAccentColor:accentColor];
        } else {
            NSLog(@"Error: accentColor és nil.");
        }
    } else {
        NSLog(@"Error: config.plist not found in any of the standard locations.");
    }
}

@end
