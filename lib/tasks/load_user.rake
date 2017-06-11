namespace :load do
  task user: :environment do

    PWD = 'xaver'

    User.create(
      email: 'nicanorperera@gmail.com',
      password: PWD, 
      password_confirmation:  PWD
    )

  end
end