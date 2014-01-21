require 'test_helper'

class ClassifiedTest < ActiveSupport::TestCase
  def test_classified_can_be_created
      @classified = Classified.new
      assert(@classified.valid?)
    end
end
