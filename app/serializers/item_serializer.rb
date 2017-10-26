class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    %w(jill bob jane joe chis alex sally peach dragon).shuffle.first
  end
end
