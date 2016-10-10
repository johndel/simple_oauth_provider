# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'admin@johndel.gr', password: 'password', password_confirmation: 'password', is_admin: true)
User.create(email: 'user@johndel.gr', password: 'password', password_confirmation: 'password')
OauthApplication.create!([
  {name: "test", uid: "72b9a6f89cf220d99225035968e409a5d3af393633d5627ebbed59758181eabd", secret: "1729cffff4d2bfc1e4dab1bcf63d7c2cced93a729787ab6e35b1055036734957", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: "name email address"}
])