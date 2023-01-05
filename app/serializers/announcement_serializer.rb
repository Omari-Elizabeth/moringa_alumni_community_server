class AnnouncementSerializer < ActiveModel::Serializer
  attributes :id, :title, :content

  # belongs_to :admin
end
