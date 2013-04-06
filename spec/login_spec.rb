describe 'Login View Controller' do
  tests LoginVC

  # it should drop the email field keyboard when the background is tapped
  # it should drop the password field keyboard when the background is tapped
  # it should advance the keyboard after the email field hits 'next'
  #
  # it should slide out the login button when signup is tapped
  # it should slide in the confirm password field when signup is tapped
  #
  # it should drop the confirm password field keyboard when the background is tapped
  # it should slide out the confirm password field when the background is tapped
  # it should slide the login button back in when the background is tapped

  it 'should drop the email field keyboard when the background is tapped' do
    tap('email')
    controller.email_field.isEditing.should == true

    # tap below the nav bar
    tap(controller.view, :at => CGPoint.make(x:5, y:50))
    controller.email_field.isEditing.should == false
  end

  it 'should drop the password field keyboard when the background is tapped' do
    tap('password')
    controller.password_field.isEditing.should == true

    # tap below the nav bar
    tap(controller.view, :at => CGPoint.make(x:5, y:50))
    controller.password_field.isEditing.should == false
  end

  it 'should advance the keyboard after the email keyboard hits \'next\'' do
    tap('email')
    controller.email_field.isEditing.should == true

    tap(controller.view, :at => CGPoint.make(x:310, y:558)) if Device.iphone?
    controller.password_field.isEditing.should == true
  end

  describe 'Signup View Operations' do
    before do
      tap('Sign Up')
    end

    it 'should slide out the login button when signup is tapped' do
      login_button_left_edge = view('Let\'s Lift').center.x - LoginControlsWidth / 2
      login_button_left_edge.should >= Device.screen.width
    end

    it 'should slide in the confirm password field when signup is tapped' do
      field = controller.confirm_password_field
      underline = controller.confirm_password_underline

      field.center.x.should == controller.view.center.x
      underline.center.x.should == controller.view.center.x
    end

    it 'should drop the confirm password field keyboard when the background is tapped' do
      tap('Confirm Password')
      controller.confirm_password_field.isEditing.should == true

      # tap below the nav bar
      tap(controller.view, :at => CGPoint.make(x:5, y:50))
      controller.confirm_password_field.isEditing.should == false
    end

    it 'should slide out the confirm password field when the background is tapped' do
      tap(controller.view, :at => CGPoint.make(x:5, y:50)) # tap below the nav bar

      confirm_password_field_right_edge = controller.confirm_password_field.center.x + LoginControlsWidth / 2
      confirm_password_underline_right_edge = controller.confirm_password_underline.center.x + LoginControlsWidth / 2

      confirm_password_field_right_edge.should <= 0
      confirm_password_underline_right_edge.should <= 0
    end

    it 'should slide the login button back in when the background is tapped' do
      tap(controller.view, :at => CGPoint.make(x:5, y:50)) # tap below the nav bar

      login_center_x = controller.login_button.center.x
      login_center_x.should == controller.view.center.x
    end
  end # signup view operations
end
