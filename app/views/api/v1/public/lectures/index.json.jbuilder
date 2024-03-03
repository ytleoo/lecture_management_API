json.first_term do
  json.array! @first_term, :id, :name, :term
end
json.second_term do
  json.array! @second_term, :id, :name, :term
end

