class SignupSerializer < ActiveModel::Serializer
  attributes :time

  belongs_to :camper
  belongs_to :activity
end
