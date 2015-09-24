# -*- coding: utf-8 -*-

module API
  module Ver1
    class Searches < Grape::API

      resource :search do
        desc 'simple search API'
        get do

          query = ''
          params.each_with_index do |(key, value), index|
            query += "#{key} like '%#{value}%'"
            query += " AND " if params.size-1 != index
          end

          puts Subject.where(query)
        end
      end
    end
  end
end
