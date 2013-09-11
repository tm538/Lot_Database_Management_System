require 'csv'

namespace :import_csv do
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
          :role => row[5],
          :id => row[6]
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
          :extra => row[4]
        })
      end    
    end
    
    desc "Import lots from csv file"
    task :import_lots => [:environment] do
    
      file = "db/lots.csv"
    
      CSV.foreach(file, :headers => true) do |row|
        Lot.create!({
          :id => row[0],          
          :client_id => row[1],
          :commercial => row[2],
          :samp_id => row[3],
          :sampletype_id => row[4],
          :commonname_id => row[5],
          :phylum => row[6],          
          :l_class => row[7],
          :genus => row[8],
          :species => row[9],
          :sample_form => row[10],
          :region => row[11],
          :site => row[12],
          :analysis_by => row[13],
          :isotopes => row[14],
          :zooms => row[15],
          :aar => row[16],
          :lipid => row[17],
          :dna => row[18],
          :analysis_other => row[19],
          :to_return => row[20],
          :returned => row[21],
          :return_date => row[22],
          :archive_box => row[23],
          :extra_info => row[24],
          :data_entered_by => row[25]
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