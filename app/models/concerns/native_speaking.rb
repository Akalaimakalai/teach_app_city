# frozen_string_literal: true
require "active_support/concern"

module NativeSpeaking
  extend ActiveSupport::Concern
 
  def speak
    "speaks the local language"
  end
end
