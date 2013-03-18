module DashboardWorld
    def go_to_dashboard
      visit root_path
      click_on "Dashboard"
    end
end

World(DashboardWorld)
