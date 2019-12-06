require 'rails_helper.rb'

feature "Promise gifts" do
    scenario "User promises a gift to another user" do
        visit new_user_path
        fill_in "Name", with: "John Smith"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Create Account"
        click_button "Create Gift"
        click_link "Logout"
        click_link "Create Account"
        fill_in "Name", with: "Jane Smith"
        fill_in "Email", with: "jsmit2@uncc.edu"
        fill_in "Password", with: "Password321"
        click_button "Create Account"
        click_link "Friends"
        click_link "View"
        click_link "Promise Gift"
        expect(page).to have_content "Remove Promise"
    end
    
    scenario "User can't see gifts promised to other users" do
        visit new_user_path
        fill_in "Name", with: "John Smith"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Create Account"
        click_button "Create Gift"
        click_link "Logout"
        click_link "Create Account"
        fill_in "Name", with: "Jane Smith"
        fill_in "Email", with: "jsmit2@uncc.edu"
        fill_in "Password", with: "Password321"
        click_button "Create Account"
        click_link "Friends"
        click_link "View"
        click_link "Promise Gift"
        click_link "Logout"
        click_link "Create Account"
        fill_in "Name", with: "Joe Schmoe"
        fill_in "Email", with: "jschmo@uncc.edu"
        fill_in "Password", with: "Password000"
        click_button "Create Account"
        click_link "Friends"
        page.all("tr")[1].click_link "View"
        expect(page).not_to have_content "Promise Gift"
        expect(page).not_to have_content "Remove Promise" 
    end
    
    scenario "Users can still see gifts promised to them" do
        visit new_user_path
        fill_in "Name", with: "John Smith"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Create Account"
        click_button "Create Gift"
        click_link "Logout"
        click_link "Login"
        fill_in "Email", with: "jsmith@uncc.edu"
        fill_in "Password", with: "Password123"
        click_button "Login"
        expect(page).to have_content "Edit Gift"
        expect(page).to have_content "Delete Gift"
    end
end