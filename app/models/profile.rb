class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_and_last_names_not_null
  validate :gender_male_or_female
  validate :not_male_and_sue

  scope :get_all_profiles, -> (min_birth_year, max_birth_year) { where("birth_year BETWEEN :min_age and :max_age", min_age: min_birth_year, max_age: max_birth_year).order(birth_year: :asc) }
  def first_and_last_names_not_null
	  if first_name.nil? && last_name.nil?
		  errors.add(:first_name, "and last_name cannot both be nil")
	  end
  end
  def gender_male_or_female
	  if gender != "male" && gender != "female"
		  errors.add(:gender, "must be male or female")
	  end
  end
  def not_male_and_sue
	  if gender == "male" && first_name == "Sue"
		  errors.add(:first_name, "cannot be Sue if gender is male")
	  end
  end
end
