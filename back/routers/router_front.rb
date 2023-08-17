set(:auth) do |*roles|   # <- notice the splat here
  condition do
    if (login_in? == false || admin? == false)
      redirect "/login", 303
    end
  end
end

# before '/admin/*' do
#   authenticate_admin(session)
# end

get '/admin' , :auth => :admin  do
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

def authenticate_admin(session)
  123
end
