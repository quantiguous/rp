class RemoveParamCntFromReport < ActiveRecord::Migration
  def change
    remove_column :rp_reports, :params_cnt, :integer, comment: 'the count of parameters for this report'
  end
end
