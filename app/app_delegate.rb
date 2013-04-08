# helpful shortcuts
DoneWithKeyboard = UIControlEventEditingDidEndOnExit

# quick db test/production changing
BaseURL = 'http://localhost'

class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    customize_appearance

    nav = UINavigationController.alloc.initWithRootViewController(LoginVC.new)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = nav
    @window.makeKeyAndVisible

    true
  end

  def customize_appearance
    UINavigationBar.appearance.setBackgroundImage('nav_bg.png'.uiimage, forBarMetrics:UIBarMetricsDefault)
    UINavigationBar.appearance.setTitleTextAttributes(UITextAttributeTextColor => :white.uicolor, UITextAttributeFont => 'PatrickHand-Regular'.uifont(24))
  end
end
