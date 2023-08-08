get '*/' do
  send_file(File.join(settings.public_folder,   'index.html'))
end

def file_from_public(*file_path, prefix: 'html')
  send_file(File.join(settings.public_folder, prefix, *file_path))
end
