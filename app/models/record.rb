class Record < ActiveRecord::Base
  belongs_to :recording_sheet
  attr_accessible :grouping, :minute, :notes, :student, :teacher, :topic, :recording_sheet_id

  before_save do |record|
    if record.minute % 5 == 0
      @interval_records = Record.where(:recording_sheet_id => record.recording_sheet_id).where("minute BETWEEN ? AND ?", record.minute - 4, record.minute - 1)
      @interval_records.push record
      summary = summarize @interval_records
      record.summary = summary
    end
  end

  def string
    teacher.to_s + student.to_s + grouping.to_s + topic.to_s
  end
  
  def summarize(records)
    teacher_summary = { :P => 0, :C => 0, :A => 0, :D => 0, :R => 0, :L => 0, :O => 0 }
    student_summary = { :P => 0, :C => 0, :A => 0, :D => 0, :R => 0, :L => 0, :O => 0 }
    grouping_summary = { :i => 0, :p => 0, :s => 0, :w => 0, :f => 0, :o => 0 }
    topic_summary = { :cc => 0, :rs => 0, :m => 0, :d => 0, :o => 0 }

    records.each do |record|
      unless record.teacher.empty?
        teacher_summary[:P] += record.teacher.count 'P'
        teacher_summary[:C] += record.teacher.count 'C'
        teacher_summary[:A] += record.teacher.count 'A'
        teacher_summary[:D] += record.teacher.count 'D'
        teacher_summary[:R] += record.teacher.count 'R'
        teacher_summary[:L] += record.teacher.count 'L'
        teacher_summary[:O] += record.teacher.count 'O'
      end

      unless record.student.empty?
        student_summary[:P] += record.student.count 'P'
        student_summary[:C] += record.student.count 'C'
        student_summary[:A] += record.student.count 'A'
        student_summary[:D] += record.student.count 'D'
        student_summary[:R] += record.student.count 'R'
        student_summary[:L] += record.student.count 'L'
        student_summary[:O] += record.student.count 'O'
      end

      unless record.grouping.empty?
        grouping_summary[:i] += record.grouping.count 'i'
        grouping_summary[:p] += record.grouping.count 'p'
        grouping_summary[:s] += record.grouping.count 's'
        grouping_summary[:w] += record.grouping.count 'w'
        grouping_summary[:f] += record.grouping.count 'f'
        grouping_summary[:o] += record.grouping.count 'o'
      end

      unless record.topic.empty?
        topic_summary[:cc] += record.topic.count 'cc'
        topic_summary[:rs] += record.topic.count 'rs'
        topic_summary[:m] += record.topic.count 'm'
        topic_summary[:d] += record.topic.count 'd'
        topic_summary[:o] += record.topic.count 'o'
      end
    end

    #find the letter with more values and set it as summary
    summary = most_occurrent_char(teacher_summary) + most_occurrent_char(student_summary) + most_occurrent_char(grouping_summary) + most_occurrent_char(topic_summary)
  end

  def most_occurrent_char(char_count_hash)
    most_occurrent = ""
    times = 0
    char_count_hash.each do |idx, value|
      if value > 0
        if times == 0
          most_occurrent = idx.to_s
          times = value
        elsif value > times
          most_occurrent = idx.to_s
          times = value
        end
      end 
    end
    most_occurrent
  end
end
