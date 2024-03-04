json.first_term do
  json.array! @first_term_registrations, partial: 'api/v1/registrations/registration', as: :registration
end
json.second_term do
  json.array! @second_term_registrations, partial: 'api/v1/registrations/registration', as: :registration
end
