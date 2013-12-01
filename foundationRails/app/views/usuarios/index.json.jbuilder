json.array!(@usuarios) do |usuario|
  json.extract! usuario, :username, :pass, :admin, :email, :nombre, :a_paterno, :a_materno, :sexo, :f_nacimiento
  json.url usuario_url(usuario, format: :json)
end
