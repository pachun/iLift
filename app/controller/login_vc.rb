class LoginVC < UIViewController
  attr_accessor :email_field, :password_field, :login_button, :signup_button,
    :in_signup_view, :confirm_password_field, :confirm_password_underline,
    :bro

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
        animate_signup :out
        @password_field.returnKeyType = UIReturnKeyGo
        @password_field.when(DoneWithKeyboard) { login }
      end
    end

    # if signup tapped, animate to signup view &
    # forward keyboard (password field => confirm password field)
    @signup_button.when_tapped do
      if not @in_signup_view
        animate_signup :in
        @password_field.returnKeyType = UIReturnKeyNext
        @password_field.when(DoneWithKeyboard) { @confirm_password_field.becomeFirstResponder }
      else
        signup
      end
    end
  end

  # animate confirm password field in (slide stuff right) or out (slide stuff left)
  def animate_signup(direction)
    direction = (direction == :in ? :right : :left)

    @in_signup_view = !@in_signup_view
    [@login_button, @confirm_password_field, @confirm_password_underline].each do |moving_part|
      moving_part.slide(direction, Device.screen.width)
    end
  end

  def drop_keyboard
    @email_field.resignFirstResponder
    @password_field.resignFirstResponder
    @confirm_password_field.resignFirstResponder
  end

  def signup
    drop_keyboard

    # show notification: signing you up
    if valid_passwords_match?
      @bro = Bro.new(:email => @email_field.text, :password => @password_field.text)
      @bro.signup do
        if @bro.saved?
          puts "worked"
          # show notification: signed up
        else
          puts "name in use"
          # show notification: email already in use
        end
      end
    else
      # show notification: password mismatch
    end
  end

  def login
    drop_keyboard
  end

  def valid_passwords_match?
    @password_field.text == @confirm_password_field.text && @password_field.text != nil && @password_field.text.length > 4
  end
end
