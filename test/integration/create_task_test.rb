require "test_helper"

class CreateTaskTest < ActionDispatch::IntegrationTest
  test 'create task for other user' do
    get new_task_path
    before = Task.count 
    post tasks_path, params: { task: { user_id: 1, name:"", description:"", priority:"", house_id: 1, due_date: nil} }
    post tasks_path, params: { task: { user_id: 2, name:"", description:"", priority:"", house_id: 1, due_date: nil} }
    after = Task.count
    assert_equal(after-before,0)
  end
end
