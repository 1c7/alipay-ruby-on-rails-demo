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
    logger.debug '----看一下这里为什么会有问题1-----'
    logger.debug @client2.inspect
    logger.debug '----看一下这里为什么会有问题2-----'

    if @client2.verify?(request.request_parameters)
      logger.debug "--------------------------------回调成功!!!--------------------------------"
      render plain: 'success'
    end
  end

  def get_notify
    pp = {"gmt_create"=>"2019-11-30 20:56:26", "charset"=>"GBK", "seller_email"=>"kqjyrw3674@sandbox.com", "notify_time"=>"2019-11-30 20:56:26", "subject"=>"QR Code \xB8\xB6\xBF\xEE\xB2\xE2\xCA\xD4", "sign"=>"mJKpzdWGG1HJEkEbOEKLe8OAYeAqr01hfQqTntDCSCI2vmt2s4swKz9XtseBjtnZWaTITBXdvQahFUkUVJmFrsajZuwX9ajC9XKjCKQFmf1VuJ8X14Y4Ss7kwT/vh07DwS3WEeAtfm5lpnaoBRHMB7uv3AvNJ2FYku2YEJEdQMJln96C9Xzjs6uQVTgsrPX1RLS2UTErelc7VMLaPTf7IeoUZI2B2AFxeNZmCosQdgyZDSwB96LSUfpRhp577fVMBGfIurMI7aSfai7WnIQruLSoKBhbGQcECwuMlJ8Rvu5VfCDQ+J/XSMkU/ItL+Ize+MUGGcKqzC4qqY+bZ3G4qw==", "buyer_id"=>"2088102180070894", "version"=>"1.0", "notify_id"=>"2019113000222205626070891003480852", "notify_type"=>"trade_status_sync", "out_trade_no"=>"1575118573", "total_amount"=>"12.33", "trade_status"=>"WAIT_BUYER_PAY", "trade_no"=>"2019113022001470891002746303", "auth_app_id"=>"2016101600699094", "buyer_logon_id"=>"wod***@sandbox.com", "app_id"=>"2016101600699094", "sign_type"=>"RSA2", "seller_id"=>"2088102179817606"}
    @client2 = Alipay::Client.new(
      url: ENV['ALIPAY_API'],
      app_id: ENV['APP_ID'],
      app_private_key: ENV['APP_PRIVATE_KEY'],
      alipay_public_key: ENV['ALIPAY_PUBLIC_KEY']
    )
    # render plain: ENV['APP_PRIVATE_KEY']
    # render plain: ENV['ALIPAY_PUBLIC_KEY']
    # return
    if @client2.verify?(pp)
      logger.debug "--------------------------------回调成功!!!--------------------------------"
      render plain: 'success'
    end
  end

end
