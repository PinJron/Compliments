set(:auth) do |*_roles|   # <- notice the splat here
  condition do
    redirect '/login', 303 if logged_in? == false || admin? == false
  end
end

# before '/admin/*' do
#   authenticate_admin(session)
# end

get '/admin', auth: :admin do
  send_file(File.join(settings.public_folder,   'index.html'))
end

get '/all_compliments', auth: :admin do
  send_file(File.join(settings.public_folder,   'index.html'))
end

get '/login' do
  send_file(File.join(settings.public_folder,   'index.html'))
end

get '/register' do
  send_file(File.join(settings.public_folder,   'index.html'))
end

get '/profile' do
  send_file(File.join(settings.public_folder,   'index.html'))
end

get '/' do
  send_file(File.join(settings.public_folder,   'index.html'))
end

def file_from_public(*file_path, prefix: 'html')
  send_file(File.join(settings.public_folder, prefix, *file_path))
end
