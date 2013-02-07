module RecordingSheetsWorld
  ADD_NEW_RECORDING_SHEET_SELECTOR = 'Add Recording sheet'
  TEACHER_SELECTOR = 'Teacher'
  SCHOOL_YEAR_SELECTOR = 'School year'
  SEMESTER_SELECTOR = 'Semester'
  DEPARTMENT_SELECTOR = 'Department'
  TYPE_OF_SCHOOL_SELECTOR = 'Type of school'
  NUMBER_OF_STUDENTS_SELECTOR = 'Number of students'
  INTERVAL_SELECTOR = 'Interval'
  CREATE_NEW_RECORDING_SHEET_SELECTOR = 'Create Recording sheet'
  COURSE_SELECTOR = 'Course'

  def add_recording_sheet(options)
    @recording_sheet_attributes = FactoryGirl.attributes_for :recording_sheet
    @teacher = FactoryGirl.create :teacher
    @department = FactoryGirl.create :department
    visit root_path
    click_on ADD_NEW_RECORDING_SHEET_SELECTOR
    select @teacher.email, :from => TEACHER_SELECTOR
    fill_in SCHOOL_YEAR_SELECTOR, :with => @recording_sheet_attributes[:school_year]
    fill_in SEMESTER_SELECTOR, :with => @recording_sheet_attributes[:semester]
    select @department.name, :from => DEPARTMENT_SELECTOR
    select @recording_sheet_attributes[:type_of_school], :from => TYPE_OF_SCHOOL_SELECTOR
    if options[:course]
      select options[:course].name, :from => COURSE_SELECTOR
    end
    fill_in NUMBER_OF_STUDENTS_SELECTOR, :with => @recording_sheet_attributes[:number_of_students]
    select @recording_sheet_attributes[:interval], :from => INTERVAL_SELECTOR
    click_on CREATE_NEW_RECORDING_SHEET_SELECTOR
    RecordingSheet.last
  end
  
  def assert_recording_sheet_presence(recording_sheet, options)
    visit recording_sheet_path(recording_sheet)
    page.should have_content(options[:course].name)
  end
end

World(RecordingSheetsWorld)
