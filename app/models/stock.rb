class Stock < ApplicationRecord
  include YahooFinanceConcern

  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.new_lookup(ticker_symbol)
    # client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
    #                               endpoint: 'https://sandbox.iexapis.com/v1',)
    # #client.price(ticker_symbol)
    # #company_name: client.company(ticker_symbol).company_name
    # #last_price: client.price(ticker_symbol)
    # begin
    new(ticker: ticker_symbol, name: "Loch Ness Monster", last_price: 3.50)
    # rescue => exception
    #   return nil
    # end
  end

  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
