require 'test_helper'

class RecordingSheetsControllerTest < ActionController::TestCase
  setup do
    @recording_sheet = recording_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recording_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recording_sheet" do
    assert_difference('RecordingSheet.count') do
      post :create, recording_sheet: { course: @recording_sheet.course, interval: @recording_sheet.interval, number_of_students: @recording_sheet.number_of_students, recorded_on: @recording_sheet.recorded_on, school_year: @recording_sheet.school_year, semester: @recording_sheet.semester, type_of_school: @recording_sheet.type_of_school }
    end

    assert_redirected_to recording_sheet_path(assigns(:recording_sheet))
  end

  test "should show recording_sheet" do
    get :show, id: @recording_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recording_sheet
    assert_response :success
  end

  test "should update recording_sheet" do
    put :update, id: @recording_sheet, recording_sheet: { course: @recording_sheet.course, interval: @recording_sheet.interval, number_of_students: @recording_sheet.number_of_students, recorded_on: @recording_sheet.recorded_on, school_year: @recording_sheet.school_year, semester: @recording_sheet.semester, type_of_school: @recording_sheet.type_of_school }
    assert_redirected_to recording_sheet_path(assigns(:recording_sheet))
  end

  test "should destroy recording_sheet" do
    assert_difference('RecordingSheet.count', -1) do
      delete :destroy, id: @recording_sheet
    end

    assert_redirected_to recording_sheets_path
  end
end
