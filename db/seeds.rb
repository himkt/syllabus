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

  next unless record[0]

  Subject.create({
    :scode=>record[0].sub(/\.0$/,''),
    :sname=>record[1],
    :unit=>record[2],
    :grade=>record[3],
    :semester=>record[4],
    :time=>record[5],
    :location=>record[6],
    :lecturer=>record[7],
    :summary=>record[8],
    :note=>record[9],
    :credit=>record[10],
    :conditions=>record[11],
    :alternative=>record[12]
  })

  exit
end
