namespace :load do
  task pages: :environment do

    def load_content(filename)
      path = File.join(Rails.root.join, 'lib', 'tasks', 'data', filename)
      File.open(path).read
    end


    Page.create(
      title:        '¿Por qué Ser Veganos?',
      description:  'Ser Vegano promueve la abolición del uso de los animales en todas sus formas, mediante educación vegana no violenta y creativa.',
      content:      load_content('why_veganism.textile'),
      old_slug:     'por_que_ser_vegano',
      site_id:      1,
      page_type:    'static', protected: true, public: true
    )

    Page.create(
      title:        '¿Cómo ser veganos?',
      description:  'Ser vegano es muy fácil. Lo único que tenés que hacer es discontinuar el consumo de productos animales, incluyendo lo que comés, vestís y usás.',
      content:      load_content('how_to_go_vegan.textile'),
      old_slug:     'como_ser_vegano',
      site_id:      1,
      page_type:    'static', protected: true, public: true
    )

    Page.create(
      title:        'Enfoque abolicionista',
      description:  'Ser Vegano defiende el enfoque Abolicionista a los Derechos de los Animales',
      content:      load_content('abolitionist.textile'),
      old_slug:     'enfoque_abolicionista',
      site_id:      1,
      page_type:    'static', protected: true, public: true
    )

  end
end