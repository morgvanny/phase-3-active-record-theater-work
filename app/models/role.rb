class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.pluck(:actor)
  end

  def locations
    auditions.pluck(:location)
  end

  def lead
    auditions.find_by(hired: true) || "no actor has been hired for this role"

    # longer way:
    # hired_auditions = auditions.where(hired: true)
    # if hired_auditions.count > 0
    #   hired_auditions.first # or: hired_auditions[0]
    # else
    #   "no actor has been hired for this role"
    # end
  end

  def understudy
    auditions.where(hired: true)[1] || "no actor has been hired for understudy for this role"
    # longer way:
    # hired_auditions = auditions.where(hired: true)
    # if hired_auditions.count > 1
    #   hired_auditions.second # or: hired_auditions[1]
    # else
    #   "no actor has been hired for this role"
    # end
  end
end