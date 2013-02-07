module CoursesWorld
  COURSES_LINK_SELECTOR = "Courses"
  COURSES_ADD_NEW_COURSE_SELECTOR = "Add Course"
  COURSES_NAME_FIELD = "Name"
  COURSES_CREATE_COURSE_BUTTON = "Create Course"

  def add_course
    @course_attributes = FactoryGirl.attributes_for :course
    visit root_path
    click_on COURSES_LINK_SELECTOR
    click_on COURSES_ADD_NEW_COURSE_SELECTOR
    fill_in COURSES_NAME_FIELD, :with => @course_attributes['name']
    click_on COURSES_CREATE_COURSE_BUTTON
  end

  def find_course
    visit root_path
    click_on COURSES_LINK_SELECTOR
    page.should have_content(@course_attributes['name'])
  end
end

World(CoursesWorld)
