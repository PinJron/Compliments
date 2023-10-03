json.array!(@compliments) do |compliment|
  json.partial! 'compliment', compliment: compliment
end