require_relative '../models/user'

RSpec.describe User do
  it 'raises when btree size is to small' do
    compliment = Compliment.find_by(id: 5)

    expect(5).to eq 6
  end
end
