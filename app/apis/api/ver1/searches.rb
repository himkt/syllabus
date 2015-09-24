# -*- coding: utf-8 -*-

module API
  module Ver1
    class Searches < Grape::API

      resource :search do
        desc 'simple search API'
        get do
          {"count"=> Subject.all.size}
        end
      end
    end
  end
end
