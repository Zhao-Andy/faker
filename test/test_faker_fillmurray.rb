require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerFillmurray < Test::Unit::TestCase
  def setup
    @tester = Faker::Fillmurray
  end

  def test_fillmurray_with_no_arguments
    assert @tester.image.match(/https:\/\/fillmurray\.com\/(\d+)\/(\d+)/)[1] != nil
  end

  def test_fillmurray_with_all_arguments
    assert @tester.image(false, '300', '300').match(/https:\/\/fillmurray\.com\/(\d+)\/(\d+)/) != nil
  end

  def test_fillmurray_with_grayscale
    assert @tester.image(true, '300', '300').match(/https:\/\/fillmurray\.com\/(g?\/?)(\d+)\/(\d+)/)[1] == 'g/'
  end

  def test_fillmurray_with_incorrect_height_format
    assert_raise ArgumentError do
      @tester.image(false, '300', 'nine-thousand')
    end

  end

  def test_fillmurray_with_incorrect_width_format
    assert_raise ArgumentError do
      @tester.image(false, 'three-hundred')
    end
  end

  def test_fillmurray_with_incorrect_grayscale
    assert_raise ArgumentError do
      @tester.image('gray', '300', '400')
    end
  end
end
