module Admin::PermissionsHelper
  def permissions
    {
      "view" => "View",
      "create tickets" => "Create Tickets",
      "edit tickets" => "Edit Tickets",
      "delete tickets" => "Delete Tickets",
      "change states" => "Change States"
    }
  end
end