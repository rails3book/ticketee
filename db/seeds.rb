admin_user = User.create(:email => "admin@ticketee.com",
                         :password => "password")
admin_user.admin = true
admin_user.confirm!

Project.create(:name => "Ticketee Beta")