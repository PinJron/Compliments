# def get_compliment(id)
#   compliment = Compliment.find_by(id: id)

#   return { status: :error_compliment_not_found }.to_json unless compliment

#   if compliment.is_used == true
#     { status: :is_used }.to_json
#   else
#     compliment.update!(is_used: true)
#     { status: :ok }.merge!(compliment.attributes).to_json
#   end
# end

# def get_random_compliment
#   compliment = Compliment.where(is_used: false).order('RANDOM()').first

#   return { status: :error_compliment_not_found }.to_json unless compliment

#   compliment.update!(is_used: true)
#   { status: :ok }.merge!(compliment.attributes).to_json
# end

# def get_compliments(sorted_by, limit, offset)
#   compliments = Compliment.all
#   compliments = compliments.limit(limit) if limit != 0
#   compliments = compliments.offset(offset) if offset != 0
#   compliments = compliments.order(likes: :desc) if sorted_by == 'most-liked'
#   compliments = compliments.order(:likes) if sorted_by == 'min-liked'
#   compliments.to_json
# end

# def create_compliment(_response, request)
#   payload = get_payload(request)
#   return { status: :error_you_are_not_logged_in }.to_json unless current_user

#   compliment = Compliment.create(compliment_text: payload[:compliment],
#                                  created_by_id: current_user.id)

#   compliment.to_json
# end

# def delete_compliment(id)
#   compliment = Compliment.find_by(id: id)

#   return { status: :error_you_are_not_logged_in }.to_json unless current_user

#   return { status: :error_compliments_not_exist }.to_json unless compliment

#   compliment.destroy.to_json
# end

# def delete_all_compliments
#   return { status: :error_you_are_not_logged_in }.to_json unless current_user

#   { status: :error_access_not_allowed }.to_json unless current_user.admin?

#   # это работает, но ради безопасности закоменчено
#   # Compliment.destroy_all
# end

# def like_compliment(id)
#   compliment = Compliment.find_by(id: id)
#   return { status: :error_compliment_not_found }.to_json unless compliment

#   compliment.likes += 1
#   compliment.save!
#   compliment.likes.to_json
# end

# def unlike_compliment(id)
#   compliment = Compliment.find_by(id: id)
#   return { status: :error_compliment_not_found }.to_json unless compliment

#   compliment.likes -= 1
#   compliment.save!
#   compliment.likes.to_json
# end

# def dislike_compliment(id)
#   compliment = Compliment.find_by(id: id)
#   return { status: :error_compliment_not_found }.to_json unless compliment

#   compliment.dislikes += 1
#   compliment.save!
#   compliment.dislikes.to_json
# end
