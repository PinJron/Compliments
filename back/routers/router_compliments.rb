post '/api/compliments' do
  create_compliment(response, request)
end

delete '/api/compliments/:id' do
  delete_compliment(params['id'].to_i)
end

get '/api/compliments/random' do
  get_random_compliment
end

get '/api/compliments/:id' do
  get_compliment(params['id'].to_i)
end
