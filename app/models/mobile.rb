require 'csv'
class Mobile < ApplicationRecord

  def self.import(file,message)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    arr = []
    (2..spreadsheet.last_row).each do |i|
      arr << spreadsheet.row(i)[0].to_i.to_s
    end

    puts arr.inspect

    arr.uniq.each do |number|
      if number.present? && /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/.match(number)
        SendJob.perform_later(number, message) if number.size == 10
      end
    end

  end

  def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
       when '.csv'  then Roo::CSV.new(file.path, packed: false, file_warning: :ignore)
       when '.xls'  then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
       when '.xlsx' then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
      else raise "unknown File type: #{file.original_filename}"
      end
  end

end
