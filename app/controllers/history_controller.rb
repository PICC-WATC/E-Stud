class HistoryController < ApplicationController
    def create
        History.create!(
                        label: $label,
                        q_type: $q_type,
                        usr_id: $usr_id)
        redirect_to '/choose_course'
    end
end
