require 'test_helper'

class LecturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lecture = lectures(:one)
  end

  test 'should get index' do
    get lectures_url, as: :json
    assert_response :success
  end

  test 'should create lecture' do
    assert_difference('Lecture.count') do
      post lectures_url, params: { lecture: { description: @lecture.description, name: @lecture.name } }, as: :json
    end

    assert_response :created
  end

  test 'should show lecture' do
    get lecture_url(@lecture), as: :json
    assert_response :success
  end

  test 'should update lecture' do
    patch lecture_url(@lecture), params: { lecture: { description: @lecture.description, name: @lecture.name } },
                                 as: :json
    assert_response :success
  end

  test 'should destroy lecture' do
    assert_difference('Lecture.count', -1) do
      delete lecture_url(@lecture), as: :json
    end

    assert_response :no_content
  end
end
