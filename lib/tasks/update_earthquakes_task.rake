namespace :earthquakes do
  desc "This task update Earthquakes"
  task update_data: :environment do
    Earthquakes::RetrieveData.call
  end
end