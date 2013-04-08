module Notification
  @@view = nil
  @@subtitle = :hidden
  @@notification = nil

  def self.show(type, message: message)
    @@notification.hide unless @@notification.nil?

    type = case(type)
           when :success
             type = EKNotifViewTypeSuccess
           when :failure
             type = EKNotifViewTypeFailure
           when :loading
             type = EKNotifViewTypeLoading
           else
             type = EKNotifViewTypeInfo
           end

    subtitle = case(@@subtitle)
               when :hidden
                 subtitle = EKNotifViewTextStyleTitle
               else
                 subtitle = EKNotifViewTextStyleSubtitle
               end

    @@notification = EKNotifView.alloc.initWithNotifViewType(type, notifPosition:EKNotifViewPositionTop, notifTextStyle:subtitle, andParentView:@@view)

    @@notification.changeFontOfLabel(EKNotifViewTextStyleTitle, to:'PatrickHand-Regular'.uifont(22))
    @@notification.changeTitleOfLabel(EKNotifViewTextStyleTitle, to:message)

    if @@subtitle != :hidden
      @@notification.changeTitleOfLabel(EKNotifViewTextStyleSubtitle, to:@@subtitle)
      @@notification.changeFontOfLabel(EKNotifViewTextStyleSubtitle, to:'PatrickHand-Regular'.uifont(16))
    end

    @@notification.show
  end

  def self.hide
    @@notification.hide
  end

  def self.view=(view)
    @@view = view
  end

  def self.subtitle=(subtitle)
    @@subtitle = subtitle
  end
end
