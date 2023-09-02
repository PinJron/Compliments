post '/api/compliments' do
  puts 123123123123
  puts cookies[:user_id]
  create_compliment(response, request)
end

get '/api/compliments' do
  get_compliments(params['sorted_by'], params['limit'].to_i, params['offset'].to_i)
end

get '/api/compliments/random' do
  get_random_compliment
end

get '/api/compliments/:id' do
  get_compliment(params['id'].to_i)
end

patch '*/api/compliments/:id/like' do
  like_compliment(params['id'].to_i)
end

patch '*/api/compliments/:id/unlike' do
  unlike_compliment(params['id'].to_i)
end

patch '*/api/compliments/:id/dislike' do
  dislike_compliment(params['id'].to_i)
end

delete '/api/compliments/:id' do
  delete_compliment(params['id'].to_i)
end

delete '/api/compliments' do
  delete_all_compliments
end
