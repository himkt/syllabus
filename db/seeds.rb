# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

s = Roo::Excelx.new('vendor/kdb.xlsx')

s.each_with_index do |arr, index|
  next if index <= 4
  record = []
  arr.each_with_index do |item, _|
    next if index == 2 || index == 14
    if item != nil
      item = "#{item.to_s.gsub(/\n/, '')}"
    end
    record.push(item)
  end

  begin
    Subject.create({
      :scode=>record[0],
      :sname=>record[1],
      :unit=>record[3],
      :grade=>record[4],
      :semester=>record[5],
      :time=>record[6],
      :location=>record[7],
      :lecturer=>record[8],
      :summary=>record[9],
      :note=>record[10],
      :credit=>record[11],
      :conditions=>record[12],
      :alternative=>record[13]
    })
  rescue=>e
    puts e
  end
end
