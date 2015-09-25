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
          arel = Subject.arel_table
          subjects = Subject.select(normal_fields + like_fields + ['id', 'conditions'])

          params.each do |key, value|
            case key
            when *normal_fields
              subjects = subjects.where(key => value)
            when *like_fields
              subjects = subjects.where(arel[key].matches("%#{value}%"))
            end
          end

          hits = subjects.size

          # TODO: implement  since_id
          # result = subjects.offset(params[:since_id].to_i).first(20) if params[:since_id]
          # result = subjects.first(20) unless params[:since_id]
          
          # patch
          # TODO: migrate (remove null data from database)
          subjects = subjects.where("scode IS NOT NULL")
          result = subjects.first(20)

          {"status" => "ok", "encoding" => "UTF-8", "hits" => hits, "result" => result}
        end
      end
    end
  end
end
