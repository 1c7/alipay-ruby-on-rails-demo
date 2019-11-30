require 'alipay'
class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token # 这行很重要, 否则 notify 支付宝异步通知会 Can't verify CSRF token authenticity.

  # 生成付款二维码
  def index
    @client = Alipay::Client.new(
      url: ENV['ALIPAY_API'],
      app_id: ENV['APP_ID'],
      app_private_key: ENV['APP_PRIVATE_KEY'],
      alipay_public_key: ENV['ALIPAY_PUBLIC_KEY']
    )
    # 创建支付订单并取得订单信息
    response = @client.execute(
      method: 'alipay.trade.precreate',
      notify_url: 'https://alipay-demo-private.herokuapp.com/notify',
      biz_content: JSON.generate({
        out_trade_no: Time.now.to_i,
        total_amount: '12.33',
        subject: 'QR Code test'
      }, ascii_only: true)
    )
    # => '{\"alipay_trade_precreate_response\":{\"code\"...'

    # 提取二维码地址
    @qr_code = JSON.parse(response)["alipay_trade_precreate_response"]["qr_code"]
  end

  # 支付宝的 POST 回调地址
  def notify
    @client2 = Alipay::Client.new(
      url: ENV['ALIPAY_API'],
      app_id: ENV['APP_ID'],
      app_private_key: ENV['APP_PRIVATE_KEY'],
      alipay_public_key: ENV['ALIPAY_PUBLIC_KEY']
    )

    if @client2.verify?(request.request_parameters)
      logger.debug "--------------------------------签名验证成功! #{Time.now}--------------------------------"
      render plain: 'success'
    end
  end
end
