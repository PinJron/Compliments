def getCompliment(id)
    compliment = Compliment.find_by(id:)
    id += 1
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

def createCompliment(response, request)
    request.body.rewind
    payload = JSON.parse(request.body.read, symbolize_names: true)
    # payload = JSON.parse(request.body, symbolize_keys:true)
    # binding.irb
    # payload = JSON.parse(request.body.read, symbolize_names: true)
  
    # puts payload
    compliment = Compliment.create("name": payload[:name])
    # puts 123
    # puts response.body
end

def deleteCompliment(id)
    compliment = Compliment.find_by(id: id).destroy
end

# это в целом нахуй не надо
# def editCompliment(id)
#     compliment = Compliment.find_by(id: id)
#     compliment.update(name: '')
# end