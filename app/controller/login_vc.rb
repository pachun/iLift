class LoginVC < UIViewController
  attr_accessor :email_field, :password_field, :login_button, :signup_button,
    :in_signup_view, :confirm_password_field, :confirm_password_underline

  def viewDidLoad
    super

    @in_signup_view = false

    view.when_tapped do
      drop_keyboard
      leave_signup_view if @in_signup_view
    end

    @email_field.when(DoneWithKeyboard) do
      @password_field.becomeFirstResponder
    end

    @signup_button.when_tapped do
      animate_to_signup if not @in_signup_view
    end
  end

  def leave_signup_view
    @in_signup_view = false
    [@login_button, @confirm_password_field, @confirm_password_underline].each do |moving_part|
      moving_part.slide(:left, Device.screen.width)
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
end
