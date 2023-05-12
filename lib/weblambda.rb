# Copyright 2023 Ahmet Cetinkaya

# This file is part of weblambda.

# weblambda is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# weblambda is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with weblambda.  If not, see <http://www.gnu.org/licenses/>.

require 'sinatra/base'

module Sinatra
  module WebLambda
    def get_input_path(path)
      '/' + path
    end

    def get_result_path(path)
      '/' + path + 'result'
    end

    def get_action_path(path)
      path + 'result'
    end

    def form_page(path, &job_block)
      action_path = get_action_path(path)
      str = "<div id='weblambda-form'><form method='post' action='#{action_path}'>"
      job_block.parameters.each do |param|
        param_name = param[1].to_s
        label_str = param_name
        str += "<div class='field'>"
        str += "<label for='#{param_name}'>#{label_str}:</label>"
        if param_name.index('text') # text area
          str += "<textarea rows='10' name=#{param_name}></textarea>"
        else
          str += "<input type='text' name='#{param_name}'/>"
        end
        str += "</div>"
      end
      str += "<input type='submit' value='submit'/>"
      str += "</form></div>"
      str
    end

    def web_lambda(path, erb_template=nil, &job_block)
      input_path = get_input_path(path)
      result_path = get_result_path(path)
      form_str = form_page(path, &job_block)
      get input_path do
        if erb_template
          erb erb_template do
            form_str
          end
        else
          form_str
        end
      end

      post result_path do
        job_block.call(*job_block.parameters.map{ |p| params[p[1]]})
      end
    end
  end

  register WebLambda
end
