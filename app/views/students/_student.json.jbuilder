json.extract! student, :id, :first_name, :last_name, :email, :year_of_birth, :gender, :address, :fathers_name, :mothers_name, :created_at, :updated_at
json.url student_url(student, format: :json)
