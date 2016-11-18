require 'csv'

csv = CSV.read('/path_to_file')
column_names = csv.first
csv_arr_hashes = csv.map{|row| Hash[column_names.zip(row)] }



csv_text = File.read('...')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Moulding.create!(row.to_hash)
end
