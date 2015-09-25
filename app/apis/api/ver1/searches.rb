# -*- coding: utf-8 -*-

module API
  module Ver1
    class Searches < Grape::API

      # query type init
      normal_fields = ['unit', 'credit']
      like_fields = ['scode', 'sname', 'location', 'semester', 'time', 'lecturer', 'summary', 'note', 'alternative', 'grade']

      resource :search do
        desc 'simple search API'
        get do

          begin
            query = ''
            params.each_with_index do |(key, value), index|
              if normal_fields.include?(key) || like_fields.include?(key)
                query += "#{key} = '#{value}'" if normal_fields.include?(key)
                query += "#{key} like '%#{value}%'" if like_fields.include?(key)
                query += " AND "
              end
            end
            query = query.sub(/AND\s$/, '') if /AND\s$/ =~ query
            subjects = Subject
              .select("scode, sname, unit, grade, semester, time, location, lecturer, summary, note, credit, conditions, alternative")
              .where(query)
            hits = subjects.size
            
            # TODO: implement  since_id
            # result = subjects.offset(params[:since_id].to_i).first(20) if params[:since_id]
            # result = subjects.first(20) unless params[:since_id]
            result = subjects.first(20)

            {"status" => "ok", "encoding" => "UTF-8", "hits" => hits, "result" => result}
          rescue
            {"status" => "error"}
          end
        end
      end
    end
  end
end
