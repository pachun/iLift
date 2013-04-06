class LoginVC < UIViewController
  stylesheet :login_sheet

  layout :root do
    @email_field = subview(UITextField, :email_field, :placeholder => 'email')
    subview(UIView, :email_underline)

    @password_field = subview(UITextField, :password_field, :placeholder => 'password')
    subview(UIView, :password_underline)

    @signup_button = subview(UIButton.custom, :signup_button)
    @login_button = subview(UIButton.custom, :login_button)

    subview(UIImageView, :lift_bro)
    subview(UILabel, :he_lifts_bro_label)
    subview(UILabel, :do_label)
    subview(UILabel, :you_label)
    subview(UILabel, :question_mark_label)

    @confirm_password_field = subview(UITextField, :confirm_password_field, :placeholder => 'Confirm Password')
    @confirm_password_underline = subview(UIView, :confirm_password_underline)
  end

  def layoutDidLoad
    super
    navigationItem.title = 'Welcome'

    @signup_button.setTitle('Sign Up', forState:UIControlStateNormal)
    @login_button.setTitle('Let\'s Lift', forState:UIControlStateNormal)

    @password_field.secureTextEntry = true
    @confirm_password_field.secureTextEntry = true
  end
end
