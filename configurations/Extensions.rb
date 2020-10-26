
require "shellwords"

#change pods envioroment
def pod_selector(pods_env)
  color(32) { puts "Current User: " + ENV["USER"] }
    function_name = "#{pods_env}_pods"

    if self.respond_to?(function_name)
      eval(function_name)
    else
      abort("The function named #{function_name} doesn't exist!")
    end
    color(32) { puts "Using #{pods_env} pods" }
  puts "--------------------------------------------------------------------------------"
end


# workaround for https://github.com/CocoaPods/CocoaPods/issues/3289
def workaround_dependencies()
  Pod::Installer::Xcode::TargetValidator.send(:define_method, :verify_no_static_framework_transitive_dependencies) { }
end

#Handle Assests into pods
def handle_assests(installer)
  color(32) { puts "\nHandle Assests into pods" }
  dirPwd = "#{Dir.pwd}"
  assets_domain = DEBUG_DOMAINS - IGNORE_ASSETS_DOMAINS

  puts "assets_domain #{assets_domain}"

  pod_targets = installer.pod_targets.flat_map do |pod_target|
    if assets_domain.include? pod_target.name
      path_assets = Pathname(installer.sandbox.pod_dir("OPUIElements")) + "OPUIElements/Assets/Assets.xcassets"
      path = Pathname(installer.sandbox.pod_dir(pod_target.name)) + pod_target.name + "Assets/"

      path_assets_shell = Shellwords.shellescape path_assets
      path_shell = Shellwords.shellescape path

      puts "Delete: #{path_shell}Assets.xcassets"
      system("rm -rf #{path_shell}Assets.xcassets") #This is to delete deprecated assets!

      if ENV["LINK_ASSETS"] != nil
        puts "skipping symbolic links to ui ellemts, reason: ENV LINK_ASSETS exists."
      else
        puts "ln -s #{path_assets_shell} #{path_shell}"
        system ("ln -s #{path_assets_shell} #{path_shell}")
      end
    end
  end
end
