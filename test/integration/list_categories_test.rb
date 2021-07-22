require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: 'Sports')
    @category_two = Category.create(name: 'Travel')
  end

  test 'should show categories listing' do
    get '/categories'
    assert_select 'a[href=?]', category_path(@category), text: @category.name
    assert_select 'a[href=?]', category_path(@category_two), text: @category_two.name
  end
end
