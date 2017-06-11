namespace :load do
  task sites: :environment do

    Site.create(
      code: :es,
      name: 'Ser Vegano en Español',
      description: 'Ser Vegano promueve la abolición del uso de los animales en todas sus formas, mediante educación vegana no violenta y creativa.'
    )

    Site.create(
      code: :en,
      name: 'To Be Vegan in English',
      description: 'To Be Vegan promotes the abolition of animal use in all its forms, through creative nonviolent vegan education.'
    )
    
  end
end