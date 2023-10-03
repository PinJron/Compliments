json.array!(@all_compliments) do |compliment|
  json.partial! 'compliment', compliment: compliment
end