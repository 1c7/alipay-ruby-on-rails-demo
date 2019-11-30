require 'alipay'
class HomeController < ApplicationController
  def index
    @client = Alipay::Client.new(
      url: ENV['ALIPAY_API'],
      app_id: ENV['APP_ID'],
      app_private_key: ENV['APP_PRIVATE_KEY'],
      alipay_public_key: ENV['ALIPAY_PUBLIC_KEY']
    )
    # logger.debug @client.inspect
    # 创建支付订单并取得订单信息
    response = @client.execute(
      method: 'alipay.trade.precreate',
      notify_url: 'https://mystore.com/orders/20160401000000/notify',
      biz_content: JSON.generate({
        out_trade_no: '20160401000000',
        total_amount: '50.00',
        subject: 'QR Code Test'
      }, ascii_only: true)
    )
    # => '{\"alipay_trade_precreate_response\":{\"code\"...'

    # 提取二维码地址
    @qr_code = JSON.parse(response)["alipay_trade_precreate_response"]["qr_code"]
    logger.debug @qr_code
    # => 'https://qr.alipay.com/abcdefggfedcba'
    # logger.debug '345678999919191919191919'
    # logger.debug @haha
    # logger.debug '345678999919191919191919'
  end
end
