#import "AppDelegate.h"
#import "FlurryAPI.h"

@implementation AppDelegate

@synthesize window = _window;

#pragma mark Uncaught exception handler
void uncaughtExceptionHandler(NSException *exception)
{
  [FlurryAPI logError:@"Uncaught Exception"
              message:[exception name]
            exception:exception];
}

#pragma mark Application lifecycle
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [FlurryAPI startSession:@"FLURRY_API_KEY_HERE"];

  NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);

  [self.window makeKeyAndVisible];
  return YES;
}

#pragma mark Memory management
- (void)dealloc
{
  self.window = nil;
  [super dealloc];
}

@end
