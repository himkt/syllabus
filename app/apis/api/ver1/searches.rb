# -*- coding: utf-8 -*-

module API
  module Ver1
    class Searches < Grape::API

      # query type init
      normal_fields = ['scode', 'unit', 'grade', 'credit']
      like_fields = ['sname', 'location', 'semester', 'time', 'lecturer', 'summary', 'note']

      resource :search do
        desc 'simple search API'
        get do

          begin
            query = ''
            params.each_with_index do |(key, value), index|
              query += "#{key} like '#{value}'" if normal_fields.include?(key)
              query += "#{key} like '%#{value}%'" if like_fields.include?(key)
              query += " AND " if params.size-1 != index
            end
            {"status" => "ok", "result" => Subject.where(query)}

          rescue
            {"status" => "error"}
          end
        end
      end
    end
  end
end
