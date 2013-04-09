class RecordingSheet < ActiveRecord::Base
  belongs_to :observer, :class_name => "User"
  belongs_to :teacher, :class_name => "User"
  belongs_to :department
  belongs_to :course
  has_many :records

  attr_accessible :course_id, :interval, :number_of_students, :recorded_on, :school_year, :semester, :type_of_school, :observer_id, :teacher_id, :department_id

  validates_presence_of :course_id, :interval, :number_of_students, :recorded_on, :school_year, :semester, :type_of_school, :observer_id, :teacher_id, :department_id


  def summarize
    teacher_summary = { "P - Presenting" => 0,
                        "C - Circulating" => 0, 
                        "A - Answering" => 0,
                        "D - Discussing" => 0,
                        "R - Reading / Writing" => 0,
                        "L - Listening" => 0,
                        "O - Other" => 0 }
    student_summary = { "P - Presenting" => 0,
                        "C - Circulating" => 0, 
                        "A - Answering" => 0,
                        "D - Discussing" => 0,
                        "R - Reading / Writing" => 0,
                        "L - Listening" => 0,
                        "O - Other" => 0 }
    grouping_summary = { "i - individual / one-on-one" => 0,
                         "p - pair work"=> 0,
                         "s - small group" => 0,
                         "w - whole group" => 0, 
                         "f - fluid" => 0, 
                         "o - other"=> 0 }
    topic_summary = { :cc => 0, :rs => 0, :m => 0, :d => 0, :o => 0 }

    @records = Record.where(:recording_sheet_id => self.id)
    @records.each do |record|
      teacher_summary["P - Presenting"] += record.teacher.count 'P'
      teacher_summary["C - Circulating"] += record.teacher.count 'C'
      teacher_summary["A - Answering"] += record.teacher.count 'A'
      teacher_summary["D - Discussing"] += record.teacher.count 'D'
      teacher_summary["R - Reading / Writing"] += record.teacher.count 'R'
      teacher_summary["L - Listening"] += record.teacher.count 'L'
      teacher_summary["O - Other"] += record.teacher.count 'O'

      student_summary["P - Presenting"] += record.student.count 'P'
      student_summary["C - Circulating"] += record.student.count 'C'
      student_summary["A - Answering"] += record.student.count 'A'
      student_summary["D - Discussing"] += record.student.count 'D'
      student_summary["R - Reading / Writing"] += record.student.count 'R'
      student_summary["L - Listening"] += record.student.count 'L'
      student_summary["O - Other"] += record.student.count 'O'

      grouping_summary["i - individual / one-on-one"] += record.grouping.count 'i'
      grouping_summary["p - pair work"] += record.grouping.count 'p'
      grouping_summary["s - small group"] += record.grouping.count 's'
      grouping_summary["w - whole group"] += record.grouping.count 'w'
      grouping_summary["f - fluid"] += record.grouping.count 'f'
      grouping_summary["o - other"] += record.grouping.count 'o'

      topic_summary[:cc] += record.topic.count 'cc'
      topic_summary[:rs] += record.topic.count 'rs'
      topic_summary[:m] += record.topic.count 'm'
      topic_summary[:d] += record.topic.count 'd'
      topic_summary[:o] += record.topic.count 'o'
    end
    {
      :teacher => teacher_summary, 
      :student => student_summary, 
      :grouping => grouping_summary,
      :topic => topic_summary
    }
  end

  def self.batch(conditions=[])
    recording_sheets = scoped
    conditions.each do |name, *values|
      recording_sheets = recording_sheets.send(name, *values)
    end
    recording_sheets
  end
end
