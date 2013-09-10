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
          :extra => row[4]
        })
      end    
    end
end 