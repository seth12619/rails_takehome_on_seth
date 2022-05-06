class Task5 < ActiveRecord::Base
  include Task5Concern

  has_many :notes, as: :noteable, dependent: :destroy
end
