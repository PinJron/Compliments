json.array!(@all_users) do |user|
  json.partial! 'user', user: user
end