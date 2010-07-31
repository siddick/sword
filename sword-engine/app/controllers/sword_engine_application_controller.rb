require 'sword/component/helper'
class SwordEngineApplicationController < ApplicationController
  include Sword::Component::Helper
  before_filter :component_init
  layout :component_layout

end
