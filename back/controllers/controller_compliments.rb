def get_compliment(id)
    compliment = Compliment.find_by(id:)
    if compliment
        if compliment.is_used == true
            compliment = {status: :is_used}.to_json
        else
            # compliment.is_used = true //проставление метки использован в бд
            # compliment.save
            compliment = {status: :ok}.merge!(compliment.attributes).to_json
        end
    else
        compliment = {status: :not_found}.to_json
    end
end

def create_compliment(response, request)
    request.body.rewind
    payload = JSON.parse(request.body.read, symbolize_names: true)
    # payload = JSON.parse(request.body, symbolize_keys:true)
    # binding.irb
    # payload = JSON.parse(request.body.read, symbolize_names: true)
  
    # puts payload
    compliment = Compliment.create("name": payload[:compliment])
    # puts 123
    # puts response.body
end

def delete_compliment(id)
    compliment = Compliment.find_by(id: id)
    if compliment
        compliment.destroy
        compliment
    else
        response = {status: :error_compliments_doesnt_exist}.to_json
    end
end

def delete_all_compliments
  user_role = User.find_by(id: session[:user_id]).role_id
  if user_role == 1
    Compliment.destroy_all
  else
    response = {status: :error_access_not_allowed}.to_json
  end
end

def get_random_compliment
    compliment = Compliment.where(is_used: false).order('RANDOM()').first
    if compliment
        puts compliment.name
        compliment.is_used = true
        compliment.save!
        compliment = {status: :ok}.merge!(compliment.attributes).to_json
    else
        compliment = {status: :not_found}.to_json
    end
end

# def delete_all_users
#     user_role = User.find_by(id: session[:user_id]).role_id
#     if user_role == 1
#       User.destroy_all
#     else
#       response = {status: :error_access_not_allowed}.to_json
#     end
#   end

# это в целом нахуй не надо
# def editCompliment(id)
#     compliment = Compliment.find_by(id: id)
#     compliment.update(name: '')
# end