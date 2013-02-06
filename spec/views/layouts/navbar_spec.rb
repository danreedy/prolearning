require "spec_helper"

describe "layouts/_navbar" do
  it "displays a link to courses" do
    view.stub(:user_signed_in?).and_return true
    render
    rendered.should have_link 'Courses', :href => courses_path
  end 
end
