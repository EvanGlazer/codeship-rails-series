class UserSerializer < ActiveModelSerializers::Model
  attributes :first_name, :last_name, :email
end
