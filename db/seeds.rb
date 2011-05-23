admin_user = User.create(:email => "admin@ticketee.com",
                         :password => "password")
admin_user.admin = true
admin_user.confirm!

Project.create(:name => "Ticketee Beta")

State.create(:name       => "New", 
             :background => "#85FF00",
             :color      => "white",
             :default    => true)
 
State.create(:name       => "Open",
             :background => "#00CFFD",
             :color      => "white")

State.create(:name       => "Closed",
             :background => "black",
             :color      => "white")