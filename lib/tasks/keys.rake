# For managing API keys since we don't have a GUI
# All generated keys have all access.
namespace :keys do
  desc "List all api keys"
  task list: :environment do
    if ApiKey.all.empty?
      puts "No keys found"
      exit
    end

    ApiKey.all.each do |key|
      puts key.to_s
    end
  end

  desc "Generate new key"
  task :new, [:name] => :environment do |t, args|
    if args.name.blank?
      puts "Please supply a name for this key so you know what it's for in six months"
      puts "Sample: rails keys:new[Elfodd Gwynedd]"
      exit
    end

    key = ApiKey.create! name: args[:name]
    puts Rainbow("New key generated ⚙️").green
    puts Rainbow("--------------------------------------------").blue
    puts key.to_s
  end

  desc "Delete a key"
  task :delete, [:id] => :environment do |t, args|
    if args.id.blank?
      puts "You have to give an ID to actually delete"
      puts "Sample: rails keys:delete[12]"
      exit
    end

    key = ApiKey.find(args[:id])

    if key.nil?
      puts "No key found for id #{args[:id]}"
      exit
    end

    key.destroy!
    puts "Successfully deleted key ##{args[:id]}"
  end
end
