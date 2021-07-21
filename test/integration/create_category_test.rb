require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test 'get new category and create category' do
    get '/categories/new'
    assert_response :success

    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'Life' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Life', response.body
  end

  test 'get new category and receive error category submission' do
    get '/categories/new'
    assert_response :success

    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: ' ' } }
    end
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
