require 'active_support/concern'

module Sluggable
  extend ActiveSupport::Concern

  SLUG_FORMAT = /\A[a-z0-9-]+\z/.freeze

  included do
    before_validation :generate_slug
    validates :slug, presence: true, format: SLUG_FORMAT
  end

  def generate_slug
    raise "Slug input fields are not defined for #{self.class.name} model" unless self.class.slug_input_fields

    if slug.nil? || slug.empty?
      # Build slug from specified input fields
      slug_string = self.class.slug_input_fields.inject('') do |slug_source, field_path|
        field = get_value_by_field_path(field_path)
        "#{slug_source} #{field}"
      end

      self.slug = slug_string.parameterize
    end
  end

  class_methods do
    attr_reader :slug_input_fields

    private

    def has_slug(input_fields: [])
      raise ArgumentError, "Inputs fields can't be empty" if input_fields.empty?

      @slug_input_fields = input_fields
    end
  end

  def get_value_by_field_path(path)
    field_path = path.is_a?(Array) ? path : [path]
    field_path.inject(self) do |current_value, path_element|
      return nil if current_value.nil?

      current_value.send(path_element)
    end
  end
end
