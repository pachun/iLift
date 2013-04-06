IPhonePortraitKeyboardHeight = 216
LoginControlsWidth = 220
LoginButtonHeight = 60

Teacup::Stylesheet.new(:login_sheet) do
  style :root,
    backgroundColor: :white.uicolor

  style :signup_button,
    backgroundColor: 0xff634d.uicolor,
    font: 'Chalkduster'.uifont(28),
    layer: {cornerRadius: 2},
    constraints: [
      constrain(:bottom).equals(:superview, :bottom).minus(IPhonePortraitKeyboardHeight + 10),
      constrain(:center_x).equals(:superview, :center_x),
      constrain_width(LoginControlsWidth),
      constrain_height(LoginButtonHeight)
    ]

  style :login_button,
    backgroundColor: 0x5746cc.uicolor,
    font: 'Chalkduster'.uifont(28),
    layer: {cornerRadius: 2},
    constraints: [
      constrain_above(:signup_button, 10),
      constrain(:center_x).equals(:superview, :center_x),
      constrain_width(LoginControlsWidth),
      constrain_height(LoginButtonHeight)
    ]

  style :password_underline,
    backgroundColor: :black.uicolor,
    constraints: [
      constrain_above(:login_button, 20),
      constrain(:center_x).equals(:superview, :center_x),
      constrain_width(LoginControlsWidth),
      constrain_height(2)
    ]

  style :password_field,
    returnKeyType: UIReturnKeyGo,
    backgroundColor: :clear.uicolor,
    font: 'PatrickHand-Regular'.uifont(28),
    constraints: [
      constrain_above(:password_underline, -8),
      constrain(:center_x).equals(:superview, :center_x),
      constrain_width(LoginControlsWidth),
      constrain_height(40)
    ]

  style :email_underline,
    backgroundColor: :black.uicolor,
    constraints: [
      constrain_above(:password_field, 20),
      constrain(:center_x).equals(:superview, :center_x),
      constrain_width(LoginControlsWidth),
      constrain_height(2)
    ]

  style :email_field,
    autocorrectionType: UITextAutocorrectionTypeNo,
    autocapitalizationType: UITextAutocapitalizationTypeNone,
    returnKeyType: UIReturnKeyNext,
    keyboardType: UIKeyboardTypeEmailAddress,
    backgroundColor: :clear.uicolor,
    font: 'PatrickHand-Regular'.uifont(28),
    constraints: [
      constrain_above(:email_underline, -8),
      constrain(:center_x).equals(:superview, :center_x),
      constrain_width(LoginControlsWidth),
      constrain_height(40)
    ]

  style :lift_bro,
    image: 'lift-bro.png',
    constraints: [
      constrain(:center_x).equals(:superview, :center_x),
      constrain(:center_y).equals(:superview, :bottom).minus(15)
    ]

  style :lift_label,
    font: 'Chalkduster'.uifont(24),
    backgroundColor: :clear.uicolor,
    textColor: 0xff634d.uicolor

  style :he_lifts_bro_label, extends: :lift_label,
    text: 'He lifts bro...',
    constraints: [
      constrain_above(:do_label, 10),
      constrain(:right).equals(:question_mark_label, :right)
    ]

  style :do_label, extends: :lift_label,
    text: 'Do',
    constraints: [
      constrain(:right).equals(:you_label, :left).minus(10),
      constrain(:center_y).equals(:you_label, :center_y)
    ]

  style :you_label,
    text: 'you',
    font: 'Chalkduster'.uifont(40),
    textColor: :black.uicolor,
    constraints: [
      constrain(:right).equals(:question_mark_label, :left).minus(2),
      constrain(:center_y).equals(:question_mark_label, :center_y)
    ]

  style :question_mark_label, extends: :lift_label,
    text: '?',
    constraints: [
      constrain(:right).equals(:superview, :right).minus(20),
      constrain(:bottom).equals(:lift_bro, :top).minus(25)
    ]

  style :confirm_password_underline,
    backgroundColor: :black.uicolor,
    constraints: [
      constrain_below(:password_field, 50),
      constrain(:center_x).equals(:superview, :center_x).minus(Device.screen.width),
      constrain_width(LoginControlsWidth),
      constrain_height(2)
    ]

  style :confirm_password_field,
    returnKeyType: UIReturnKeyGo,
    backgroundColor: :clear.uicolor,
    font: 'PatrickHand-Regular'.uifont(28),
    constraints: [
      constrain_above(:confirm_password_underline, -8),
      constrain(:center_x).equals(:superview, :center_x).minus(Device.screen.width),
      constrain_width(LoginControlsWidth),
      constrain_height(40)
    ]
end
