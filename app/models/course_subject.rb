class CourseSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :course
  has_many :user_course_subjects, dependent: :destroy

  enum status: {start: 0, inprogress: 1, pending: 2, finished: 3}

  delegate :task_of_user, to: :user_course_subjects

  scope :by_course, ->(id){where course_id: id if id.present?}
  scope :in_active, ->{where status: %i(inprogress pending)}

  def started_at
    created_at.strftime Settings.validates.model.course.date_format
  end

  def find_user_course_subject_by_user user_id
    user_course_subjects.by_user(user_id).first
  end
end
