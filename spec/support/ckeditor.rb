# frozen_string_literal: true

module Ckeditor
  def fill_in_ckeditor(id, with:)
    within_frame find("#cke_#{id} iframe") do
      find("body").base.send_keys with
    end
  end
end
