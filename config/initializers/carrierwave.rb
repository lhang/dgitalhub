# encoding: utf-8

::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "12GgpTKdrLp51R5O3IZ4moBkUh_d03LXJ2e2Y8Sa"
  config.qiniu_secret_key    = 'z2o1AY2UhBAk_OdlZ8gAXO8UJ2v1ijAwueBaTEuc'
  config.qiniu_bucket        = "dgitalhub-1"
  config.qiniu_bucket_domain = "7xt49t.com1.z0.glb.clouddn.com"
  config.qiniu_bucket_private= false #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"

  # config.qiniu_up_host       = 'http://up.qiniug.com' #七牛上传海外服务器,国内使用可以不要这行配置
end
