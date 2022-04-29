class SignupSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :activity, serializer: ActivityPostSerializerSerializer


end
