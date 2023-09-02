class StaticController < ActionController::API
  def pages
    render file: Rails.root.join('public', 'index.html')
  end
end
