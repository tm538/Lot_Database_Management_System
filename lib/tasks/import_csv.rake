require 'csv'

namespace :import_csv do
  
    desc "import all"
    task :import_all => [:environment] do
      
      Rake::Task['import_csv:import_users'].execute
      Rake::Task['import_csv:import_clients'].execute
      Rake::Task['import_csv:import_sampletypes'].execute
      Rake::Task['import_csv:import_commonnames'].execute
      Rake::Task['import_csv:import_phylum'].execute
      Rake::Task['import_csv:import_genus'].execute
      Rake::Task['import_csv:import_class'].execute
      Rake::Task['import_csv:import_species'].execute
    end
      
    desc "Import Users from csv file"
    task :import_users => [:environment] do
    
      file = "db/users.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        User.create!({
          :name => row[0],
          :email => row[1],
          :password => row[2],
          :password_confirmation => row[3],
          :admin => row[4],
          :role => row[5]
        })
      end    
    end
    
    desc "Import sampletypes from csv file"
    task :import_sampletypes => [:environment] do
    
      file = "db/sampletypes.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        Sampletype.create!({
          :name => row[0]
        })
      end    
    end
    
    desc "Import commonnames from csv file"
    task :import_commonnames => [:environment] do
    
      file = "db/commonnames.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        Commonname.create!({
          :name => row[0]
        })
      end    
    end
    
    desc "Import clients from csv file"
    task :import_clients => [:environment] do
    
      file = "db/clients.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        Client.create!({
          :org => row[0],          
          :contact_name => row[1],
          :email => row[2],
          :address => row[3],
          :extra => row[4],
          :id => row[5]
        })
      end    
    end
    
    desc "Import lots from csv file"
    task :import_lots => [:environment] do
    
      file = "db/lots.csv"
    
      Batch.create!({
          :name => 'Data Migration', 
          :client_id => 1, 
          :user_id => 1,
          :restriction => 'All', 
          :commercial => false, 
          :extra => 'Data Migration from Legacy lot databse.'          
        })
    
      CSV.foreach(file, :headers => true) do |row|        
        @commonnames = Commonname.where(name: row[4])
        @sampletypes = Sampletype.where(name: row[5])
        
        Lot.create!({
          :id => row[0],          
          :client_id => 1,
          :commercial => row[2],
          :samp_id => row[3],
          :sampletype_id => @sampletypes.first.id,
          :commonname_id => @commonnames.first.id,
          :phylum => row[6],          
          :l_class => row[7],
          :genus => row[8],
          :species => row[9],
          :sample_form => row[10],
          :region => row[11],
          :town => row[12],
          :site => row[13],
          :analysis_by => 1,
          :isotopes => row[15],
          :zooms => row[16],
          :aar => row[17],
          :lipid => row[18],
          :dna => row[19],
          :analysis_other => row[20],
          :to_return => row[21],
          :returned => row[22],
          :return_date => row[23],
          :archive_box => row[24],
          :extra_info => row[25],
          :created_at => row[26],
          :data_entered_by => 1,
          :batch_id => 1,
          :restriction => 'All'
        })
      end    
    end
    
    desc "Import phylum from csv file"
    task :import_phylum => [:environment] do
    
      file = "db/phylum.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        Phylum.create!({
          :name => row[0]
        })
      end    
    end
    
    desc "Import class from csv file"
    task :import_class => [:environment] do
    
      file = "db/l_class.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        LClass.create!({
          :name => row[0]
        })
      end    
    end
    
    desc "Import genus from csv file"
    task :import_genus => [:environment] do
    
      file = "db/genus.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        Genus.create!({
          :name => row[0]
        })
      end    
    end
    
    desc "Import species from csv file"
    task :import_species => [:environment] do
    
      file = "db/species.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        Species.create!({
          :name => row[0]
        })
      end    
    end
end 