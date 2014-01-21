namespace :db_util do
  desc "load initial data into system from load files"
  task :load_data => :environment do
    puts "initializing angular rails demo data"
    
    Rake::Task["db:reset"].invoke
     
    Classified.create(name: 'Son For Sale (Cheap)',
                      description: 'Clean, one owner.  A bit Sweaty, Hairy, Eats a lot, smells bad, Talks Back, Intelligent (knows more than anyone around at any given time.  this will only decline with age so act soon!).  6foot x 180lbs. 19 years old. PRICE NEGOTIABLE.',
                      phone: '801 790 4500',
                      price: 50.00,
                      image: 'danny.jpg'
    )

    Classified.create(name: 'F250 3/4 ton Truck',
                      description: 'Great work truck, trailer brake, 7.4L BIG engine, extras',
                      phone: '801 790 4500',
                      price: 7000.00,
                      image: 'ford.jpg'
    )

    Classified.create(name: 'iPod',
                      description: '8GB version 3.0 Touch (7A341)ipod',
                      phone: '801 790 4500',
                      price: 100.00,
                      image: 'ipod.jpg'
    )

    Classified.create(name: 'HTC SmartPhone',
                      description: 'HTC EVO Model PC36100 4G.  aka HTC Supersonic',
                      phone: '801 790 4500',
                      price: 100.00,
                      image: 'phone.jpg'
    )


    puts 'done...'
  end
end

    
