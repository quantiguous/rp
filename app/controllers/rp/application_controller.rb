module Rp
  class ApplicationController < ::ApplicationController
    before_filter :authenticate_user!
    before_filter :block_inactive_user!    
  end
end
