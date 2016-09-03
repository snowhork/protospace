module TagsHelper
  def search_tag(tag_name)
      ActsAsTaggableOn::Tag.find_by(name: tag_name)
  end
end
