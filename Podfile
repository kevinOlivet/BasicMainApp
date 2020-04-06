source "https://github.com/CocoaPods/Specs.git"
platform :ios, '11.0'

###
### --- CONFIG ---
# ███╗   ███╗ █████╗ ██╗███╗   ██╗ █████╗ ██████╗ ██████╗ 
# ████╗ ████║██╔══██╗██║████╗  ██║██╔══██╗██╔══██╗██╔══██╗
# ██╔████╔██║███████║██║██╔██╗ ██║███████║██████╔╝██████╔╝
# ██║╚██╔╝██║██╔══██║██║██║╚██╗██║██╔══██║██╔═══╝ ██╔═══╝ 
# ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║██║  ██║██║     ██║     
# ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝                                                           
###


#Use this variable to change pod install from local_pods, develop_pods, master_pods, feature_pods
pods_environment = "develop" # <- HERE: Change this line, options are: 'local', develop', 'master' or 'feature'

###
### --- METHODS ---
###

#Use this funcion to compile PRIVATE pods as development in local
def local_pods
  color(32) { puts "Installing Local Pods..." }
  pod 'BasicCommons', :path => '../BasicCommons/'
  pod 'CuotasModule', :path => '../CuotasModule/'
end

#Use this funcion to compile feature pods as development in featue
def feature_pods
    ### ONLY FOR DEVELOP PURPOSES ###
    feature_branch = "master" # <- HERE: Change this line to setup ALL the pods repository from another branch WHEN pods_environment = "develop"
    ### ONLY FOR DEVELOP PURPOSES ###

    color(32) { puts "Installing Develop Pods from branch: #{feature_branch}" }
    pod 'BasicCommons', :git => 'git@github.com:kevinOlivet/BasicCommons.git', :branch => "#{feature_branch}"
    pod 'CuotasModule', :git => 'git@github.com:kevinOlivet/CuotasModule.git', :branch => "#{feature_branch}"
end

#Use this funcion to compile develop pods as development in develop
def develop_pods
    color(32) { puts "Installing Develop Pods..." }
    pod 'BasicCommons', :git => 'git@github.com:kevinOlivet/BasicCommons.git', :branch => 'develop'
    pod 'CuotasModule', :git => 'git@github.com:kevinOlivet/CuotasModule.git', :branch => 'develop'
end

#Use this funcion to compile master pods as development in master
def master_pods
    color(32) { puts "Installing Develop Pods..." }
    pod 'BasicCommons', :git => 'git@github.com:kevinOlivet/BasicCommons.git', :branch => 'master'
    pod 'CuotasModule', :git => 'git@github.com:kevinOlivet/CuotasModule.git', :branch => 'master'
end

###
### --- Utils ---
###

###
#Load commons methods.
require "./configurations/Commons.rb"
#Load podfile extensions, for post-pre instalations, etc.
require "./configurations/Extensions.rb"

color(32) {
    puts "--------------------------------------------------------------------------------"
    puts ""
    puts "███╗   ███╗ █████╗ ██╗███╗   ██╗ █████╗ ██████╗ ██████╗ "
    puts "████╗ ████║██╔══██╗██║████╗  ██║██╔══██╗██╔══██╗██╔══██╗"
    puts "██╔████╔██║███████║██║██╔██╗ ██║███████║██████╔╝██████╔╝"
    puts "██║╚██╔╝██║██╔══██║██║██║╚██╗██║██╔══██║██╔═══╝ ██╔═══╝ "
    puts "██║ ╚═╝ ██║██║  ██║██║██║ ╚████║██║  ██║██║     ██║     "
    puts "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝     "
    puts ""
    puts "--------------------------------------------------------------------------------"
    puts " Executing Pod Install #{pods_environment} For BasicMainApp"
    puts "--------------------------------------------------------------------------------"
    puts ""
}

###
### --- PROCESSING ---
###

target 'BasicMainApp' do
  color(32) { puts "\nFetching Modules Pods..." }
  use_frameworks!
  inhibit_all_warnings!
  pod "AEConsole", "0.7.0"
  pod "AlamofireNetworkActivityLogger", "~> 2.4.0"

  #MainApp Pods
  pod_selector(pods_environment)

    #Scripts
    # script_phase :name => "Swiftlint",
    #              :script => "$SRCROOT/configurations/Build-Phases/swiftlint_personas.sh",
    #              :show_env_vars_in_log => true,
    #              :execution_position => :before_compile
                 
end

# Workaround for Cocoapods issue #7606
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

use_modular_headers!
