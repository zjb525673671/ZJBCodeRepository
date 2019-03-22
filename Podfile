workspace ‘ZJBRepository.xcworkspace'
use_frameworks!
platform :ios, ‘9.0’

def shared_pods
    pod 'Masonry', '~> 1.0.2’
    pod 'SDWebImage', '~> 4.0.0’
    pod 'MJRefresh', '~> 3.1.12'
    pod 'MBProgressHUD', '~> 1.0.0'
    pod 'AFNetworking', '~> 3.1.0'
    pod 'ChameleonFramework', '~> 2.1.0' #是iOS版的平面彩色框架，它有助于减轻开发的工作量。通过运用这款强大的工具，您的应用程序必定能够获得非常华丽的界面
    pod 'lottie-ios', '~> 2.1.5'    #是一款用来解析Adobe After Effects动画的iOS库。它通过Bodymovin After Effects的插件来实现，并确保各种动画能同时在移动平台和Web平台上被精美地呈现出来。
    pod 'GPUImage', '~> 0.1.7'      #一款强大的图片滤镜工具, 支持自定义滤镜, 可用来实时处理图片和视频流
    pod 'FMDB', '~> 2.7.2'          #本地数据库
    pod 'SVGAPlayer', '~> 2.3.0' #高性能的动画播放器
    pod 'AliyunOSSiOS', '~> 2.10.7' #oss上传图片和视频文件
end

target 'ZJBRepository’ do
    project 'ZJBRepository.xcodeproj'
    shared_pods
end
