class Order < ApplicationRecord
attr_accessor :collection_date, :collection_time
belongs_to :post
belongs_to :charity
end

