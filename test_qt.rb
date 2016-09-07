require "minitest/autorun"
require_relative 'qt'
# require_relative 'brad_qt'

class TestMeme < Minitest::Test
  def setup
    @qt = QT.new
  end

  def test_qt    
    input_terms = [
      {value: "0", ord: "/building/awesome"}, 
      {value: "1", ord: "/building/awesome"}, 
      {value: "2", ord: "/building/awesome"}, 
      {value: "3", ord: "/building/awesome"}, 
      {value: "4", ord: "/building/awesome"}
    ]
    expected = [
      {value: "0", ord: "/building/awesome"}, 
      {value: "1", ord: "/building/awesome"}, 
      {value: "2", ord: "/building/awesome"}, 
      {value: "3", ord: "/building/awesome"}, 
      {value: "4", ord: "/building/awesome"}
    ]
    lower = 0
    upper = 4
    search = "awesome"
    actual = @qt.qt(input_terms, l:lower, u:upper, s:search)
    assert_equal(expected, actual) 
  end


  def test_qt_filters_ords_by_search_term    
    input_terms = [
      {value: "0", ord: "/building/awesome"}, 
      {value: "1", ord: "/building/awesome"}, 
      {value: "2", ord: "/building/sucks"}, 
      {value: "3", ord: "/building/awesome"}, 
      {value: "4", ord: "/building/awesome"}
    ]
    expected = [
      {value: "0", ord: "/building/awesome"}, 
      {value: "1", ord: "/building/awesome"}, 
      {value: "3", ord: "/building/awesome"}, 
      {value: "4", ord: "/building/awesome"}
    ]
    lower = 0
    upper = 4
    search = "awesome"
    actual = @qt.qt(input_terms, l:lower, u:upper, s:search)
    assert_equal(expected, actual) 
  end

  def test_qt_filters_by_lower_and_upper
    input_terms = [
      {value: "0", ord: "/building/awesome"}, 
      {value: "1", ord: "/building/awesome"}, 
      {value: "2", ord: "/building/sucks"}, 
      {value: "3", ord: "/building/awesome"}, 
      {value: "4", ord: "/building/awesome"}
    ]
    expected = [
      {value: "1", ord: "/building/awesome"}, 
      {value: "3", ord: "/building/awesome"}
    ]
    lower = 1
    upper = 3
    search = "awesome"
    actual = @qt.qt(input_terms, l:lower, u:upper, s:search)
    assert_equal(expected, actual) 
  end

  def test_qt_when_lower_and_upper_inputs_arent_specified
    input_terms = [
      {value: "0", ord: "/building/awesome"}, 
      {value: "1", ord: "/building/awesome"}, 
      {value: "2", ord: "/building/sucks"}, 
      {value: "3", ord: "/building/awesome"}, 
      {value: "4", ord: "/building/awesome"}
    ]
    expected = [
      {value: "0", ord: "/building/awesome"}, 
      {value: "1", ord: "/building/awesome"}, 
      {value: "3", ord: "/building/awesome"},
      {value: "4", ord: "/building/awesome"}
    ]
    search = "awesome"
    actual = @qt.qt(input_terms, s:search)
    assert_equal(expected, actual) 
  end

  def test_qt_when_search_isnt_specified
    input_terms = [
      {value: "0", ord: "/building/awesome"}, 
      {value: "1", ord: "/building/awesome"}, 
      {value: "2", ord: "/building/sucks"}, 
      {value: "3", ord: "/building/awesome"}, 
      {value: "4", ord: "/building/awesome"}
    ]
    expected = [
      {value: "1", ord: "/building/awesome"}, 
      {value: "2", ord: "/building/sucks"}, 
      {value: "3", ord: "/building/awesome"},
    ]
    lower = 1
    upper = 3
    actual = @qt.qt(input_terms, l: lower, u: upper)
    assert_equal(expected, actual) 
  end
  
end
