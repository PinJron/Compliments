class AddAdmin < ActiveRecord::Migration[7.0]
  def change
    User.create(username: 'adminadmin',
                role_id: '1',
                last_compliment_id: '1',
                password: 'adminadmin')
    User.create(username: 'useruser',
                role_id: '0',
                last_compliment_id: '1',
                password: 'useruser')
  end
end
