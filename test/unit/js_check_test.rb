require 'minitest_helper'
require 'pre-commit/checks/js_check'

class JslintCheckTest < MiniTest::Unit::TestCase

  def test_should_not_run_if_staged_files_is_empty
    check = PreCommit::JsCheck.new

    assert check.should_run?(['foo.js'])
    assert !check.should_run?([])
  end

  def test_should_reject_staged_files_that_are_not_js_files
    check = PreCommit::JsCheck.new
    assert_equal(['bar.js'], check.reject_non_js(['foo.rb', 'bar.js']))
  end

  def test_reject_staged_files_should_not_blow_up_with_a_list_of_one_file
    check = PreCommit::JsCheck.new
    assert_equal(['bar.js'], check.reject_non_js(['bar.js']))
  end

end
