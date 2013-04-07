class LoginVC < UIViewController
  attr_accessor :email_field, :password_field, :login_button, :signup_button,
    :in_signup_view, :confirm_password_field, :confirm_password_underline

  def viewDidLoad
    super

    @in_signup_view = false

    # keyboard button setup (field advancing / action triggers)
    @email_field.when(DoneWithKeyboard) { @password_field.becomeFirstResponder }
    @password_field.when(DoneWithKeyboard) { login }
    @confirm_password_field.when(DoneWithKeyboard) { signup }

    # if bg tapped in signup view, go back to login view
    view.when_tapped do
      drop_keyboard
      if @in_signup_view
        leave_signup_view
        @password_field.returnKeyType = UIReturnKeyGo
        @password_field.when(DoneWithKeyboard) { login }
      end
    end

    # if signup tapped, animate to signup view &
    # forward keyboard (password field => confirm password field)
    @signup_button.when_tapped do
      if not @in_signup_view
        animate_to_signup
        @password_field.returnKeyType = UIReturnKeyNext
        @password_field.when(DoneWithKeyboard) { @confirm_password_field.becomeFirstResponder }
      else
        signup
      end
    end
  end

  def drop_keyboard
    @email_field.resignFirstResponder
    @password_field.resignFirstResponder
    @confirm_password_field.resignFirstResponder
  end

  def animate_to_signup
    @in_signup_view = true
    [@login_button, @confirm_password_field, @confirm_password_underline].each do |moving_part|
      moving_part.slide(:right, Device.screen.width)
    end
  end

  def leave_signup_view
    @in_signup_view = false
    [@login_button, @confirm_password_field, @confirm_password_underline].each do |moving_part|
      moving_part.slide(:left, Device.screen.width)
    end
  end

  def signup
    drop_keyboard
  end

  def login
    drop_keyboard
  end
end
