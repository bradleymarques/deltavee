require "test_helper"
require "application_system_test_case"

class NotificationsTest < ApplicationSystemTestCase
  setup do
    @user = FactoryBot.create(:user)
    @mail_a = FactoryBot.create(
      :notification,
      recipient: @user,
      subject: "Mail A",
      content: "This is a test mail"
    )
    FactoryBot.create(:notification, recipient: @user, subject: "Mail B")
    FactoryBot.create(:notification, recipient: @user, subject: "Mail C")

    @mail_d = FactoryBot.create(
      :notification,
      sender: @user,
      subject: "Mail D",
      content: "I got your test mail, thanks!"
    )
    FactoryBot.create(:notification, sender: @user, subject: "Mail E")

    login_as(user: @user)
  end

  test "a user can view a list of their received notifications" do
    assert(has_text?(I18n.t("navigation.notifications")))
    click_on(I18n.t("navigation.notifications"))

    assert(has_text?("Mail A"))
    assert(has_text?("Mail B"))
    assert(has_text?("Mail C"))
  end

  test "a user can view a list of their received notifications and view one,
        thus marking it as read" do
    assert(has_text?(I18n.t("navigation.notifications")))
    click_on(I18n.t("navigation.notifications"))

    assert(has_text?("Mail A"))
    assert(has_text?("Mail B"))
    assert(has_text?("Mail C"))

    refute(@mail_a.read?)
    click_on("Mail A")

    assert(has_text?("Mail A"))
    assert(has_text?(@mail_a.sender.username))
    assert(has_text?("This is a test mail"))

    assert(@mail_a.reload.read?)
  end

  test "a user can view a list of their sent notifications" do
    assert(has_text?(I18n.t("navigation.notifications")))
    click_on(I18n.t("navigation.notifications"))

    assert(has_text?(I18n.t("notifications.outbox")))
    click_on(I18n.t("notifications.outbox"))

    assert(has_text?("Mail D"))
    assert(has_text?("Mail E"))
  end

  test "a user can view a list of their sent notifications and can view one
        but this doesn't mark it as read" do
    assert(has_text?(I18n.t("navigation.notifications")))
    click_on(I18n.t("navigation.notifications"))

    assert(has_text?(I18n.t("notifications.outbox")))
    click_on(I18n.t("notifications.outbox"))

    assert(has_text?("Mail D"))
    assert(has_text?("Mail E"))

    refute(@mail_d.read?)
    click_on("Mail D")

    assert(has_text?("Mail D"))
    assert(has_text?(@mail_d.sender.username))
    assert(has_text?("I got your test mail, thanks!"))

    refute(@mail_d.reload.read?)
  end
end
