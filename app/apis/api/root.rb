# -*- coding: utf-8 -*-

module API
  class Root < Grape::API
    # http://localhost:3000/api/

    mount API::Ver1::Root
    #mount API::Ver2::Root
  end
end
