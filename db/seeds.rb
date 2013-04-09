# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  ["Observer", "mmorales"].each do |user|
    username = user.gsub(/\s+/, "").downcase
    email = username + "@las.ch"
    pass = username
    User.create(:email => email, :password => pass, :password_confirmation => pass)
  end

  ["Science", "ESL Science", "Digital Imaging", "ESL Class", "Math Class"].each do |course|
    Department.create(name: course)
    Course.create(name: course)
    username = course.gsub(/\s+/, "").downcase
    email = username + "@las.ch"
    pass = username
    User.create(:email => email, :password => pass, :password_confirmation => pass)
  end
          

initial_data = [{
  :course => "Science",:semester => "Fall", :year =>  2012,:type_of_school => "IB Diploma",
  :teacher =>
  {
    "P" => 15,
    "C" => 34,
    "A" => 0,
    "D" => 4,
    "R" => 0,
    "L" => 2,
    "O" => 1
  }, :student =>
  {
    "P" => 2,
    "A" => 5,
    "D" => 6,
    "R" => 29,
    "L" => 14,
    "O" => 1
  }, :grouping =>
  {
    "i" => 11,
    "p" => 12,
    "s" => 10,
    "w" => 22,
    "f" => 0,
    "o" => 1
  }, :topic => 
  {
    "cc" => 55,
    "rs" => 0,
    "m" => 0,
    "d" => 0,
    "o" => 1
  }
},
{
  :course => "ESL Science",:semester => "Fall", :year => "2012",:type_of_school => "US Diploma",
  :teacher =>
  {
    "P" => 35,
    "C" => 11,
    "A" => 0,
    "D" => 2,
    "RW" => 1,
    "L" => 1,
    "O" => 6
  }, :student =>
  {
    "P" => 0,
    "A" => 17,
    "D" => 5,
    "RW" => 12,
    "L" => 13,
    "O" => 9
  }, :grouping =>
  {
    "i" => 11,
    "p" => 1,
    "s" => 4,
    "w" => 35,
    "f" => 6,
    "o" => 0
  }, :topic => 
  {
    "cc" => 51,
    "rs" => 2,
    "m" => 3,
    "d" => 0,
    "o" => 0
  }
},{
  :course => "Digital Imaging",:semester => "Spring", :year => "2012",:type_of_school => "US Diploma",
  :teacher =>
  {
    "P" => 29,
    "C" => 9,
    "A" => 1,
    "D" => 6,
    "RW" => 0,
    "L" => 10,
    "O" => 1
  }, :student =>
  {
    "P" => 16,
    "A" => 16,
    "D" => 0,
    "RW" => 5,
    "L" => 16,
    "O" => 3
  }, :grouping =>
  {
    "i" => 5,
    "p" => 5,
    "s" => 0,
    "w" => 46,
    "f" => 0,
    "o" => 0
  }, :topic => 
  {
    "cc" => 56,
    "rs" => 0,
    "m" => 0,
    "d" => 0,
    "o" => 0
  }
},{
  :course => "ESL Class",:semester => "Spring", :year => "2012",:type_of_school => "US Diploma",
  :teacher =>
  {
    "P" => 24,
    "C" => 13,
    "A" => 0,
    "D" => 0,
    "RW" => 10,
    "L" => 2,
    "O" => 7
  }, :student =>
  {
    "P" => 0,
    "A" => 8,
    "D" => 19,
    "RW" => 11,
    "L" => 15,
    "O" => 3
  }, :grouping =>
  {
    "i" => 5,
    "p" => 4,
    "s" => 17,
    "w" => 28,
    "f" => 2,
    "o" => 0
  }, :topic => 
  {
    "cc" => 48,
    "rs" => 1,
    "m" => 7,
    "d" => 0,
    "o" => 0
  }
},{
  :course => "Math Class",:semester => "Spring", :year => "2012",:type_of_school => "US Diploma",
  :teacher =>
  {
    "P" => 32,
    "C" => 10,
    "A" => 2,
    "D" => 1,
    "RW" => 0,
    "L" => 0,
    "O" => 3
  }, :student =>
  {
    "P" => 0,
    "A" => 8,
    "D" => 19,
    "RW" => 11,
    "L" => 15,
    "O" => 3
  }, :grouping =>
  {
    "i" => 5,
    "p" => 4,
    "s" => 17,
    "w" => 28,
    "f" => 2,
    "o" => 0
  }, :topic => 
  {
    "cc" => 48,
    "rs" => 1,
    "m" => 7,
    "d" => 0,
    "o" => 0
  }
}]

  initial_data.each do |data|
    observer = User.where(:email => "observer@las.ch").first
    email = data[:course].downcase.gsub(/\s+/, "") + "@las.ch"
    teacher = User.where(:email => email).first
    course = Course.where(:name => data[:course]).first
    department = Department.where(:name => data[:course]).first
    recording_sheet = RecordingSheet.create(observer_id: observer.id, 
                                            teacher_id: teacher.id, 
                                            recorded_on: Time.now, 
                                            school_year: data[:year], 
                                            semester: data[:semester], 
                                            department_id: department.id, 
                                            type_of_school: data[:type_of_school], 
                                            number_of_students: 5, 
                                            interval: 1, 
                                            course_id: course.id)

    minute = 1
    data[:teacher].each do |t|
      t.last.times do |i|
        Record.create(minute: minute, teacher: t.first, student: "", grouping: "", topic: "", recording_sheet_id: recording_sheet.id)
        minute += 1
      end
    end

    data[:student].each do |t|
      t.last.times do |i|
        Record.create(minute: minute, teacher: "", student: t.first, grouping: "", topic: "", recording_sheet_id: recording_sheet.id)
        minute += 1
      end
    end

    data[:grouping].each do |t|
      t.last.times do |i|
        Record.create(minute: minute, teacher: "", student: "", grouping: t.first, topic: "", recording_sheet_id: recording_sheet.id)
        minute += 1
      end
    end

    data[:topic].each do |t|
      t.last.times do |i|
        Record.create(minute: minute, teacher: "", student: "", grouping: "", topic: t.first, recording_sheet_id: recording_sheet.id)
        minute += 1
      end
    end
  end

