class AddUsersToTodolists < ActiveRecord::Migration
  def change
	  add_reference :todo_lists, :user, foreign_key: true
  end
end
