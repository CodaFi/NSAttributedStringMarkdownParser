//
// Copyright 2013 Jeff Verkoeyen
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "AppDelegate.h"

#import "NimbusAttributedLabel.h"
#import "NSAttributedStringMarkdownParser.h"

@implementation AppDelegate {
  UIWindow* _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  _window.backgroundColor = [UIColor whiteColor];

  NSAttributedStringMarkdownParser* parser = [[NSAttributedStringMarkdownParser alloc] init];
  parser.paragraphFont = [UIFont fontWithName:@"HelveticaNeue" size:16];
  parser.boldFontName = @"HelveticaNeue-Bold";
  NSAttributedString* string = [parser attributedStringFromMarkdownString:
                                @"This is a **bold** word.\n"
                                @"# H1\n"
                                @"This is text after the header.\n"
                                @"## H2\n"
                                @"### H3\n"
                                @"#### H4\n"
                                @"##### H5\n"
                                @"###### H6\n"
                                                                    links:nil];

  NIAttributedLabel* label = [[NIAttributedLabel alloc] init];
  label.attributedString = string;
  label.numberOfLines = 0;
  label.frame = CGRectMake(0, NIStatusBarHeight(), _window.bounds.size.width, _window.bounds.size.height - NIStatusBarHeight());
  [_window addSubview:label];

  NSLog(@"%@", string);

  [_window makeKeyAndVisible];
  return YES;
}

@end
